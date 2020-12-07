get '/todo/todo' do
    erb :'/todo/todo'
  end
  
  post '/todo' do
      date= params["date"]
      task = params["task"]
      completion = params["completion_date"]
      run_sql("INSERT INTO to_do (date, task, completion_date) VALUES ($1, $2, $3)", [date,task,completion])
      
      redirect '/todopage'
   
  end
  
  
  get '/todopage/new' do
    erb :'/todo/todo'
  end
  
  get '/todopage' do
    todos = run_sql("SELECT * FROM to_do ORDER BY id")
    erb :'/todo/todopage', locals:{
      todos: todos
    }
  end
  
  delete '/todo/:id' do
    todo_id = params['id']
    run_sql("DELETE FROM to_do WHERE id = #{todo_id} ")

    redirect '/todopage'
  end

  get '/todo/:id/edit' do
    todo_id = params['id']
    todo = run_sql("SELECT * FROM to_do WHERE id = #{todo_id}")
    todo_item = todo[0]
    erb :'/todo/todoedit', locals:{
      todo_item: todo_item
    }
  end

  patch '/todopage/:id' do
    todo_id = params['id']
    date = params['date']
    task = params['task']
    completion = params['completion_date']

    run_sql("UPDATE to_do SET date ='#{date}',task ='#{task}',completion_date='#{completion}'")

    redirect '/todopage'
  end
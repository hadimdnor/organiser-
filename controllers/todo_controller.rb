get '/todo/todo' do
    erb :'/todo/todo'
  end
  
  post '/todo' do
      date= params["date"]
      task = params["task"]
      completion = params["completion_date"]
      run_sql("INSERT INTO to_do (date, task, completion_date) VALUES ('#{date}','#{task}','#{completion}')")
      redirect '/todopage'
   
  end
  
  
  get '/todopage/new' do
    erb :'/todo/todo'
  end
  
  get '/todopage' do
    todo = run_sql("SELECT * FROM to_do ORDER BY id")
    erb :'/todo/todopage', locals:{
      todo: todo
    }
  end
  
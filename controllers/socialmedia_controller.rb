get '/socimed' do
    erb :'/socialmedia/socimed'
  end
  
  post '/socimed' do
    page_name= params["page_name"]
    page_url = params["page_url"]
    email_used = params["email_used"]
    password_hint = params["password_hint"]
    run_sql("INSERT INTO social_network (page_name, page_url, email_used, password_hint) VALUES ('#{page_name}','#{page_url}','#{email_used}','#{password_hint}')")
    
    redirect '/socimediapage'
  
  end
  
  get '/socialmedia/new' do
    erb :'/socialmedia/socimed'
  end
  
  get '/socimediapage' do
    socimeds = run_sql("SELECT * FROM social_network ORDER BY id")
    erb :'/socialmedia/socimediapage', locals:{
      socimeds: socimeds
    }
  end

  delete '/socimed/:id' do
    socimed_id = params['id']
    run_sql("DELETE FROM  social_network WHERE id = #{socimed_id} ")

    redirect '/socimediapage'
  end
  
get '/socimed/:id/edit' do
    socimed_id = params['id']
    socimed = run_sql("SELECT * FROM social_network WHERE id = #{socimed_id}")
    socimed_item = socimed[0]
    erb :'/socialmedia/socialmediaedit', locals:{
      socimed_item: socimed_item
    }
end

patch '/socimed/:id' do
    socimed_id = params['id']
    page = params['page_name']
    url = params['page_url']
    email = params['email_used']
    password = params['password_hint']


    run_sql("UPDATE social_network SET page_name ='#{page}',page_url ='#{url}',email_used='#{email}',password_hint='#{password}'")

    redirect '/socimediapage'
end
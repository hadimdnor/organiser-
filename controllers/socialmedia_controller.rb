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
    socimed = run_sql("SELECT * FROM social_network ORDER BY id")
    erb :'/socialmedia/socimediapage', locals:{
      socimed: socimed
    }
  end
  
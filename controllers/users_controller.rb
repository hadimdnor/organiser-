get '/' do
    members = run_sql("SELECT * FROM members ORDER BY id")   
    erb :login, locals: {
      members: members
    }
  end
  
  get '/' do
    erb :login
  end
  
  get '/signup/new' do
    erb :signup
  end
  
  post '/signup' do
    members_name = params["name"]
    members_email = params["email"]
    members_password = params["password"]
    members_address = params["address"]
    members_contact = params["contact_num"]
    
    create_user(name, email, password, address, contact_num)
  
  redirect '/signup/successfull'
  
  end
  
  get '/signup/successfull' do
   erb :sucsignup
  end
  
  
  get '/mainpage' do
    mainpage = run_sql("SELECT * FROM members ORDER BY id")
    erb :mainpage, locals:{
      mainpage: mainpage
    }
  end
  
  
  
  post '/sessions' do
    email= params["email"]
    password = params["password"]
    
    users = run_sql("SELECT * FROM members WHERE email = '#{email}'")
    user = user_found(users)
  
    if user && BCrypt::Password.new(user['password_digest']) == params['password']
      session[:members_id]=user['id']
      
      redirect '/mainpage'
    else
      erb :login
    end
  end
  
  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end
  
  get 'login' do
    erb :login
  end
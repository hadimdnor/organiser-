     
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'pry'
require 'pg'
require 'bcrypt'

enable :sessions

def user_found(members)
  if members.to_a.length > 0
    members[0]
  else 
    nil
  end
end

def logged_in?
  !!session[:members_id]
end

def current_user
  if logged_in?
    user_id = session[:members_id]
    members = run_sql("SELECT * FROM members WHERE id = #{user_id} ")
    member = user_found(members)
  else 
    nil
  end
end

def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'organiser_db'})
  organiser = db.exec(sql)
  db.close
  return organiser
end

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
  password_digest = BCrypt::Password.create(members_password)
  
run_sql("INSERT INTO members (name, email, password_digest, address, contact_num) VALUES ('#{members_name}','#{members_email}','#{password_digest}','#{members_address}','#{members_contact}')")  

redirect '/signup/successfull'

end

get '/signup/successfull' do
 erb :sucsignup
end


get '/mainpage' do
  mainpage = run_sql("SELECT * FROM members ORDER BY id")
  # binding.pry
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


require_relative 'controllers/family_controller'
require_relative 'controllers/financial_controller'
require_relative 'controllers/quote_controller'
require_relative 'controllers/socialmedia_controller'
require_relative 'controllers/todo_controller'


















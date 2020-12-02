     
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'pry'
require 'pg'
require 'bcrypt'

enable :sessions

def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'organiser_db'})
  movie = db.exec(sql)
  db.close
  return movie
end
get '/' do
  members = run_sql("SELECT * FROM members ORDER BY id")   

erb :index, locals: {
    members: members
  }
end

get '/' do
  erb :index
end

post '/login' do
  erb :mainpage
end

post '/signup' do
    members_name = params["name"]
    members_email = params["email"]
    members_password = params["password"]
    members_address = params["address"]
    members_contact = params["contact_num"]
    
  run_sql("INSERT INTO members (name, email, password, address, contact_num) VALUES ('#{members_name}','#{members_email}','#{members_password}','#{members_address}','#{members_contact}')")  
  
  redirect '/'
  
end

get "/signup" do
  erb :signup
end



  






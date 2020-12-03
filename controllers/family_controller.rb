get '/family' do
    erb :'/family/family'
  end
  
  post '/family' do
    name= params["name"]
    relationship= params["relationship"]
    birthday = params["birth_date"]
    address = params["address"]
    contactnumber = params["contact_num"]
    run_sql("INSERT INTO family (name, relationship, birth_date, address, contact_num) VALUES ('#{name}','#{relationship}',#{birthday},'#{address}',#{contactnumber})")
    
    redirect '/familypage'
  end
  
  get '/familypage' do
    family = run_sql("SELECT * FROM family ORDER BY id")
    erb :'/family/familypage', locals:{
      family: family
    }
  end
  
  get '/family/new' do
    erb :'/family/family'
  end
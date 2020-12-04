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
    families = run_sql("SELECT * FROM family ORDER BY id")
    erb :'/family/familypage', locals:{
      families: families
    }
  end
  
  get '/family/new' do
    erb :'/family/family'
  end  

  delete '/family/:id' do
      family_id = params['id']
      run_sql("DELETE FROM family WHERE id=#{family_id}")
      redirect '/familypage'
  end

  get '/family/:id/edit' do
    family_id = params['id']
    family = run_sql("SELECT * FROM family WHERE id = #{family_id}")
    family_item = family[0]
    erb :'/family/familyedit', locals:{
      family_item: family_item
    }
  end

  patch '/family/:id' do
    family_id = params['id']
    name = params['name']
    relationship= params['relationship']
    birth_date = params['birth_date']
    address = params['address']
    contact_num = params['contact_num']
    
    # binding.pry
    run_sql("UPDATE family SET name='#{name}', relationship='#{relationship}',birth_date=#{birth_date}, address='#{address}',contact_num=#{contact_num} ")

    redirect '/familypage'
  end
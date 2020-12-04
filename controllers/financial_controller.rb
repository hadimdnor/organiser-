get '/financialpage' do
    financials = run_sql("SELECT * FROM financial ORDER BY id")
    erb :'/financial/financialpage', locals:{
      financials: financials
    }
  end
  
  get '/financialpage/new' do
    erb :'/financial/financial'
  end
  
  post '/financial' do
    date= params["date"]
    month = params["month"]
    monthly_budget= params["monthly_budget"]
    daily_budget = params["daily_budget"]
    expanses = params["expanses"]
    utility_bill= params["utility_bill"]
    banking_information= params["banking_information"]
    run_sql("INSERT INTO financial (date, month, monthly_budget, daily_budget, expanses, utility_bill, banking_information) VALUES ('#{date}','#{month}',#{monthly_budget},#{daily_budget},#{expanses},#{utility_bill},#{banking_information})")
    
    redirect '/financialpage'
  end

  get '/financial' do
    erb :'/financial/financial'
  end

  delete '/financial/:id' do
    financial_id = params['id']
    run_sql("DELETE FROM financial WHERE id=#{financial_id}")
    
    redirect '/financialpage'
  end

  get '/financial/:id/edit' do
    financial_id = params['id']
    financial = run_sql("SELECT * FROM financial WHERE id = #{financial_id}")
    financial_item = financial[0]
    erb :'/financial/financialedit', locals:{
      financial_item: financial_item
    }
  end

  patch '/financial/:id' do
    financial_id = params['id']
    date = params['date']
    month = params['month']
    monthly_budget = params['monthly_budget']
    daily_budget = params['daily_budget']
    expanses = params['expanses']
    utility_bill = params['utility_bill']
    banking_information = params['banking_information']

    run_sql("UPDATE financial SET date ='#{date}',month ='#{month}',monthly_budget=#{monthly_budget},daily_budget=#{daily_budget}, expanses=#{expanses},utility_bill=#{utility_bill},banking_information =#{banking_information} ")

    redirect '/financialpage'
  end
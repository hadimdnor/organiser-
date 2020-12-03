get '/financialpage' do
    financial = run_sql("SELECT * FROM financial ORDER BY id")
    erb :'/financial/financialpage', locals:{
      financial: financial
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
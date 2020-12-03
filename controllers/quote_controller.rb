get '/quote/new' do
    erb :'/quote/quote'
  end
  
  post '/quote' do
    date= params["date"]
    lifequote= params["life_quote"]
    url = params["image"]
    run_sql("INSERT INTO quote (date, life_quote, image) VALUES ('#{date}','#{lifequote}','#{url}')")
    
    redirect '/quotepage'
  end
  
  get '/quotepage' do
    quote = run_sql("SELECT * FROM quote ORDER BY id")
    erb :'/quote/quotepage', locals:{
      quote: quote
    }
  end

  get '/quote' do
    erb :'/quote/quote'
  end
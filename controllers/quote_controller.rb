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
    quotes = run_sql("SELECT * FROM quote ORDER BY id")
    erb :'/quote/quotepage', locals:{
      quotes: quotes
    }
  end

  get '/quote' do
    erb :'/quote/quote'
  end

  delete '/quote/:id' do
    quote_id = params['id']
    run_sql("DELETE FROM quote WHERE id=#{quote_id}")

    redirect '/quotepage'
    
  end

  get '/quote/:id/edit' do
    quote_id = params['id']
    quote = run_sql("SELECT * FROM quote WHERE id = #{quote_id}")
    quote_item = quote[0]
    erb :'/quote/quoteedit', locals:{
      quote_item: quote_item
    }
  end

  patch '/quote/:id' do
    quote_id = params['id']
    date = params['date']
    life_quote = params['life_quote']
    image = params['image']

    run_sql("UPDATE quote SET date ='#{date}',life_quote ='#{life_quote}',image='#{image}'")

    redirect '/quotepage'
  end
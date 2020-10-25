class HomeController < ApplicationController
  def index
  #using a variable here to start the stocks api
  @api = StockQuote::Stock.new(api_key: "pk_c10395aac3814b5697d5d82713e2fe91") 
  
  # getting info from the form (coming as a parameter, and using it below), named as ticker in index.html.erb
  #error handling below
  if params[:ticker] == ""
  	@nothing = "You forgot to enter the stock symbol/code"
	  elsif params[:ticker] #if it exists
	  	begin # This beging was needed with the rescue because if 
	  		# if a wrong stock was typed, it would crash the app
	  		# the rescue avoid the app from crashing
		  	@stock = StockQuote::Stock.quote(params[:ticker])
			rescue
	  		#puts "um, that makes no sense"
	  		@error = "You typed a wrong stock symbol/code, please try again!"
		end
		
	  	#this is gonna try to render something
	  	#if !@stock #if stock doesn't exist, then go to line below
	  		#@error = "The stock symbol/code you input doesn't exist, try again"
	  	#end
	  #but we haven't sent anything to the form yet, so we need ERROR_HANDLING WITH THE IF
	  end
  end

  def about
  end

  
end

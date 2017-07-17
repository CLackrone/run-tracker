class RunnerController < ApplicationController

	get '/signup' do 
		if !logged_in?
			erb :'/runner/create_runner'
		else
			redirect '/login'
		end
	end

	post '/signup' do 
		runner = Runner.new(:username => params[:username], :email => params[:email], :password => params[:password])
		if runner.save
			session[:user_id] = runner.id 
			redirect '/runs'
		else
			#this works - needs a flash message
			redirect '/signup'
		end
	end

	get '/login' do 
		if !logged_in?
			erb :'/runner/login'
		else
			#add flash message
			redirect '/runs'
		end
	end

	post '/login' do 
		runner = Runner.find_by(:username => params[:username])
		if runner && runner.authenticate(params[:password])
			session[:user_id] = runner.id
			redirect '/runs'
		else
			#add flash message
			redirect '/signup'
		end
	end

	get '/logout' do
		if logged_in?
			session.destroy
			#add flash message - you have been successfully logged out
			redirect '/'
		else
			#add flash message - you are not logged in
			redirect '/'
		end
	end

	#create a slug/show route


end
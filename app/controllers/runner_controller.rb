class RunnerController < ApplicationController

	get '/signup' do 
			erb :'/runner/create_runner'
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
	end


end
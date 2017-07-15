class RunnerController < ApplicationController

	get '/signup' do 
			erb :'/runner/create_runner'
	end

	post '/signup' do 
		runner = Runner.new(:username => params[:username], :email => params[:email], :password => params[:password])
		if runner.save
			session[:user_id] = runner.id 
			redirect 'runs'
		else
			redirect '/signup'
		end
	end


end
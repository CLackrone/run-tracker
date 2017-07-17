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
			#add flash message - Please enter valid information- all fields required.
			redirect '/signup'
		end
	end

	get '/login' do 
		if !logged_in?
			erb :'/runner/login'
		else
			redirect '/runs'
		end
	end

	post '/login' do 
		runner = Runner.find_by(:username => params[:username])
		if runner && runner.authenticate(params[:password])
			session[:user_id] = runner.id
			redirect '/runs'
		else
			#add flash message - Your username or password did not match our records.
			redirect '/signup'
		end
	end

	get '/logout' do
		if logged_in?
			session.destroy
			redirect '/'
		else
			redirect '/'
		end
	end

	get '/runners/:slug' do 
		if @runner = Runner.find_by_slug(params[:slug])
			erb :'/runner/show'
		else 
			redirect '/'
		end
	end


end
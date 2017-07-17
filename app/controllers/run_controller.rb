class RunController < ApplicationController
	get '/runs' do 
		#@runs = current_user.runs ???
		#add "My runs" link to runner slug page
		@runner = current_user.username
		@runs = Run.all
		if logged_in?
			erb :'/runs/runs'
		else
			redirect '/login'
		end
	end

	get '/runs/new' do 
		if logged_in?
			erb :'/runs/create_run'
		else
			#add flash message - you must be logged in to create a run
			redirect '/login'
		end
	end

	post '/runs' do 
		if params[:location] == "" || params[:date] == "" || params[:distance] == ""
			#add flash message
			redirect '/runs/new'
		else
			@run = current_user.runs.create(location: params[:location], date: params[:date], distance: params[:distance])
			redirect "/runs/#{@run.id}"
		end
	end


	











end
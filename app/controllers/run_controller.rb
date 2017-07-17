class RunController < ApplicationController
	get '/runs' do 
		#@runs = current_user.runs ???
		#add "My runs" link to runner slug page
		#build out runs.erb
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

	get '/runs/:id' do 
		if logged_in?
			@run = Run.find_by_id(params[:id])
			erb :'/runs/show_run'
		else
			redirect '/login'
		end
	end

	get '/runs/:id/edit' do 
		if logged_in?
			@run = Run.find_by_id(params[:id])
			if @run.runner_id == current_user.id 
				erb :'/runs/edit_run'
			else
				redirect '/runs'
			end
		else
			redirect '/login'
		end
	end

	post "/runs/:id" do 
		if params[:location] == "" || params[:date] == "" || params[:distance] == ""
			redirect "/runs/#{params[:id]}/edit"
		else 
			@run = Run.find_by_id(params[:id])
			@run.location = params[:location]
			@run.date = params[:date]
			@run.distance = params[:distance]
			@run.save
			redirect "/runs/#{@run.id}"
		end
	end





end

























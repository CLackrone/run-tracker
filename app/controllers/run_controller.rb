class RunController < ApplicationController

	get '/runs' do 
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
			redirect '/login'
		end
	end

	post '/runs' do 
		if params[:location] == "" || params[:date] == "" || params[:distance] == ""
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
		if @run = Run.find_by_id(params[:id])
			if @run.update(params)
				redirect "/runs/#{@run.id}"
			else 
				erb :'/runs/edit_run'
			end 
		else
			redirect '/runs'
		end 
	end

	delete '/runs/:id/delete' do 
		if logged_in?
			@run = Run.find_by_id(params[:id])
			if @run.runner_id == current_user.id 
				@run.delete
				redirect '/runs'
			else
				redirect '/runs'
			end
		else
			redirect '/login'
		end
	end

	

end
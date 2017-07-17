class RunController < ApplicationController
	get '/runs' do 
		#Run.all is wrong, needs to pull just a single runner's runs
		#@runs = current_user.runs ???
		@runner = current_user.username
		if logged_in?
			erb :'/runs/runs'
		else
			redirect '/login'
		end
	end
end
class RunController < ApplicationController
	get '/runs' do 
		#Run.all is wrong, needs to pull just a single runner's runs
		@runs = Run.all
		erb :'/runs/runs'
	end
end
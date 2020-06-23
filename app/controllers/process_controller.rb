class ProcessController < ApplicationController

	def home
		job = { msg: "application is running with docker"}
		render json: JSON.pretty_generate(job)
	end

end

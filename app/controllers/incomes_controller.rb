class IncomesController < ApplicationController
	def new
		@income = Income.new
	end
end

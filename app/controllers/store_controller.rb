class StoreController < ApplicationController
	public
	def index
	end

	def show_now
		@films = Film.all
	end

	def show_after
		@films = Film.all
	end

	def about
	end
end

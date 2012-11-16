class StoreController < ApplicationController
	public
	def index
	end

	def show_now
		@films = Film.find(:all, :conditions => ["time < ?", Time.now])
	end

	def show_after
		@films = Film.find(:all, :conditions => ["time > ?", Time.now])
	end

	def about
	end

  def authorize
  end
end

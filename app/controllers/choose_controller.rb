class ChooseController < ApplicationController
	public
  def show_seat
		@film = Film.find_by_id(params[:id])
		@tickets = @film.tickets
		@times = []
		@tickets.each do |t|
			@times << t.time
		end
		@times = @times.uniq.sort
	end
end

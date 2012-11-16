#encoding: utf-8
class ChooseController < ApplicationController
	public
  def show_ticket
    @film    = Film.find_by_id(params[:id])
		@tickets = @film.tickets
    @ticket_groups = @tickets.group_by{|t| t.time}
	end

  def show_seat
    @tickets = Ticket.find(:all,
                           :conditions => ["id>=:begin and id<=:end",params])
    @position = Array.new(11){Array.new(11,0)}
    @ticketids = Array.new(11){Array.new(11,0)}
    i = 0;
    @tickets.each do |ticket|
      @ticketids[ticket.row][ticket.colume] = ticket.id
      @position[ticket.row][ticket.colume] = ticket.onsale
    end
  end

  def ensure_order
    if session[:account_id] != nil
      @account = Account.find_by_id(session[:account_id])
      @sumprice = params[:ids].sum{|id| Ticket.find_by_id(id).price}


      if @account.score > 500 && @account.score <= 1000
        @sumprice *= 0.9
      elsif @account.score > 1000 && @account.score <=2000
        @sumprice *= 0.8
      elsif @account.score > 2000
        @sumprice *= 0.7
      end

      if @sumprice <= @account.balance 
        @account.balance -= @sumprice
        @account.score += @sumprice
        @account.save(:validate => false)

      else
        redirect_to detail_url, :alert => "账户余额不足"
      end

      @order = @account.orders.create(:time=>Time.now,:price=>@sumprice);
      params[:ids].each do |id|
        @order.order_lines.create(:ticket_id=>id)
        @tmp = Ticket.find_by_id(id)
        @tmp.onsale=false
        @tmp.save
      end
      @account.orders<<@order

    else
      redirect_to login_url, alert: "请先登录" 
    end
  end

  def authorize
  end
    
end

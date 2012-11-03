class AddTestTicket < ActiveRecord::Migration
  def up
    Ticket.delete_all

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 1,
          :time => '2012-11-02 21:30',
          :room => 1,
          :colume => i,
          :row => j,
          :price => 70,
          :onsale => true
        )
      end
    end

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 1,
          :time => '2012-11-02 19:30',
          :room => 1,
          :colume => i,
          :row => j,
          :price => 70,
          :onsale => true
        )
      end
    end

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 2,
          :time => '2012-11-01 10:10',
          :room => 1,
          :colume => i,
          :row => j,
          :price => 70,
          :onsale => true
        )
      end
    end

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 3,
          :time => '2012-10-21 21:20',
          :room => 1,
          :colume => i,
          :row => j,
          :price => 70,
          :onsale => true
        )
      end
    end

    
  end

  def down
  end
end
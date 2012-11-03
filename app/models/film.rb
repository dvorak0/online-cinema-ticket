class Film < ActiveRecord::Base
  attr_accessible :category, :country, :description, :director, :length, :time, :title
  has_many :actors
  has_many :tickets
  
end

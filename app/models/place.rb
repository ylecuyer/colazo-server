class Place < ActiveRecord::Base
  attr_accessible :category, :description, :latitude, :longitude, :title
end

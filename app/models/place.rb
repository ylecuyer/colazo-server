class Place < ActiveRecord::Base
  attr_accessible :category, :description, :latitude, :longitude, :title

  def self.last_update
    
    last_place = Place.order("updated_at DESC").first()

    if last_place != nil
      return last_place.updated_at
    else
      return 0
    end
  end

end

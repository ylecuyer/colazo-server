class Event < ActiveRecord::Base
  attr_accessible :description, :name, :when, :where

  def self.last_update
    
    last_event = Event.order("updated_at DESC").first()

    if last_event != nil
      return last_event.updated_at
    else
      return 0
    end
  end

end

class Event < ActiveRecord::Base
  attr_accessible :description, :name, :when, :where
end

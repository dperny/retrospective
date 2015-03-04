class Location < ActiveRecord::Base
  has_many :stories

  def to_builder
    Jbuilder.new do |location|
      location.type "location"
      location.id id
      location.name name
      location.latitude latitude
      location.longitude longitude
    end
  end
end

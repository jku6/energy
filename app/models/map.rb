# == Schema Information
#
# Table name: maps
#
#  id            :integer          not null, primary key
#  zip           :integer
#  lat           :float
#  long          :float
#  building_type :string(255)
#  kwh           :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Map < ActiveRecord::Base
    attr_accessible :zip, :lat, :long, :building_type, :kwh
    
end

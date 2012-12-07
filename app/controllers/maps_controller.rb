class MapsController < ApplicationController

    def new
    end

    def data
      maps = Map.all
      render :json => maps
    end

    def create


      if Map.all.empty?

      x = HTTParty.get('https://data.cityofnewyork.us/api/views/74cu-ncm4/rows.json')
      y = JSON(x.body)


      z = y["data"].length

      z.times do |a|
      @zip = JSON(y["data"][a][8][0])['zip']
      @lat = y["data"][a][8][1]
      @long = y["data"][a][8][2]
      @building_type = y["data"][a][9]
      @kwh = y["data"][a][10]



      @map = Map.create(zip: @zip, lat: @lat, long: @long, building_type: @building_type, kwh: @kwh)
      end
      end
      @maps = Map.all


    end



end
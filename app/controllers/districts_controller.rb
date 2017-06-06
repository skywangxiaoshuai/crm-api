class DistrictsController < ApplicationController
  before_action :set_district, only: [:index_subdistricts]

 #Get /districts/#/subdistricts
 def index_subdistricts
   render json: @district.children
 end

 private
   def set_district
     @district = District.find(params[:id])
   end

end

class TownsController < ApplicationController
  #模糊查询
  #get /towns?q=张江
  def search_towns_by_name
    towns = Town.ransack(name_cont: params[:q]).result
    render status: '200', json: towns, each_serializer: TownSerializer
  end
end

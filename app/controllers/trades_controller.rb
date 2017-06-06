class TradesController < ApplicationController

  # post /stores/:store_id/trades?service_id=1
  # def import
  #
  #   Trade.import(file)
  #
  #   CSV.foreach(file, :headers => true) do |row|
  #     trade = @store.trades.new
  #     trade.service_id = params[:service_id]
  #     trade.date = row[:date]
  #     trade.trade_num = row[:trade_num]
  #     trade.trade_sum = row[:trade_sum]
  #     trade.save
  #   end
  # end

  # 根据企业名称和流水日期筛选
  # get /trades?store_id=1&start_date=2017-04-01&end_date=2017-04-24
  def get_trades
    # binding.pry
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    if params[:store_id]
      trades = Trade.where(store_id: params[:store_id]).where(date: (start_date..end_date))
               .page(params[:page][:number]).per(params[:page][:size])
    else
      trades = Trade.where(date: (start_date..end_date))
               .page(params[:page][:number]).per(params[:page][:size])
    end
    render status: :ok, json: trades, each_serializer: TradeSerializer,
           meta: pagination_dict(trades)
  end
end

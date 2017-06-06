class Cooperation < ApplicationRecord
	paginates_per 15 # 分页时每页显示15条数据
  belongs_to :store
  belongs_to :service
end

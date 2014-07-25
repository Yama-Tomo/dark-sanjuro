class MediaConverter < ActiveRecord::Base
  attr_accessible :bandwidth, :name, :trans_lost_from, :trans_lost_to, :code_core_num, :fiber_type,
                  :manufacturer, :price, :buying_price, :sale_price, :desc

  validates :name,              presence: true, length: {maximum: 50}
  validates :manufacturer,      presence: true
  validates :trans_lost_from,   numericality: true
  validates :trans_lost_to,     numericality: true
  validates :bandwidth,         numericality: true
  validates :fiber_type,        presence: true
  validates :code_core_num,     presence: true
  validates :price,             numericality: true, allow_blank: true
  validates :buying_price,      numericality: true, allow_blank: true
  validates :sale_price,        numericality: true, allow_blank: true

  def self.bandwidths
   [
     ["100M", 100],
     ["1G", 1000],
     ["10G", 10000],
   ]
  end
end

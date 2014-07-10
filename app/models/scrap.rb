class Scrap < ActiveRecord::Base

  attr_accessible :url, :desc, :image, :price
  validates :url, :presence => true, :format => URI::regexp(%w(http https))

end

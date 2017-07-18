class Review < ActiveRecord::Base
  validates :author, :content, :rating, :city, presence: true

  scope :by_city, -> (city_parameter) { where("city like ?", "%#{city_parameter}%")}

  max_paginates_per 5
  paginates_per 5

end

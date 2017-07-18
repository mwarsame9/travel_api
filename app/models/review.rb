class Review < ActiveRecord::Base
  validates :author, :content, :rating, :city, presence: true

  scope :by_city, -> (city_parameter) { where("city like ?", "%#{city_parameter}%")}

  # scope :by_rating, -> (rating_parameter) { where("rating = 9", "%#{rating_parameter}%")}

end

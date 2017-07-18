class Seed

  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    20.times do |i|
      # author =
      review = Review.create!(
        author: Faker::Name.first_name,
        content: Faker::TheFreshPrinceOfBelAir.quote,
        rating: Faker::Number.between(1, 10),
        city: Faker::Address.city
      )
      puts "Review #{i}: Rating is #{review.rating}, and review is '#{review.content}' for #{review.city} by #{review.author}."
    end
  end
end

Seed.begin

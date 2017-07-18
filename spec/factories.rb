FactoryGirl.define do

  factory(:review) do
    author('Haziz')
    content('Jambo!')
    rating('8')
    city('Nairobi')
  end
end

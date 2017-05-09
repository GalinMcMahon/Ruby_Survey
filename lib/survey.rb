class Survey < ActiveRecord::Base
  before_save(:titlecase)
  validates(:title, {:presence => true, :length => { :maximum => 50 }})
  has_many :questions

# private
  define_method(:titlecase) do
    words = self.title.split(" ")
    words.each do |word|
      word.capitalize!
    end
  self.title = words.join(" ")
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validate :is_click_bait

  def is_click_bait
    if !self.title.nil? && self.title.include?("Won't Believe" ||  "Secret" || "Top" || "Guess")
    else
      errors.add(:title, "Not click bait!")
    end
  end
  
end

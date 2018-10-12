class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 30 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  @PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]


    def clickbait?
      
      if @PATTERNS.each do |p| 
        p == title  end
        errors.add(:title, "not clickbait")
    end

  #must contain "Won't Believe", "Secret", "Top [number]", or "Guess"
end


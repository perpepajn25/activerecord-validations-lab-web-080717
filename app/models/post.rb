class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

  def non_clickbait
    if self.title
      if !self.title.match /Won't Believe|Secret|Top [number]|Guess/
        self.errors.add(:title, "can't be non-clicbait")
      end
    end
  end

end

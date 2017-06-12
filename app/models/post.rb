class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait

  B = [
    /believe/i,
    /secret/i,
    /top \d+/i,
    /guess/i
  ]

  def is_clickbait
    unless B.any? { |b| b.match title }
      errors.add(:title, "Isn't clickbait, thus error.")
    end
  end

end

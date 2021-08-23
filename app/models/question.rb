class Question < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 25}
  validates :body,  presence: true, length: {minimum: 2}

  def formatted_created_at
    self.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end

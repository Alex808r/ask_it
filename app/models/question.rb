class Question < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 25}
  validates :body,  presence: true, length: {minimum: 2}
end

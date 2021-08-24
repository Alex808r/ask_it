# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2, maximum: 100}
  validates :body,  presence: true, length: { minimum: 2}

  def formatted_created_at
    self.created_at.strftime('%Y-%m-%d %H:%M:%S') #self можно опустить
  end
end

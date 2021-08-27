# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true # проверка уникальности на уровен ror, не сработает если
                                                              # обращаться напряму к базе данных. Дополнительно проверку уникльности
                                                              # делаем на уровне самой базы данных, для этого прописываем это в миграции перед запуском null: false, index: {unique: true}
  validates :name, presence: true

  has_secure_password
end

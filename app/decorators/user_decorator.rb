# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def name_or_email
    name.presence || email.split('@')[0]
  end

  # аналогичная запись
  # def name_or_email
  #   return name if name.present?
  #   email.split('@')[0]
  # end
end

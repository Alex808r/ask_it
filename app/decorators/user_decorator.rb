class UserDecorator < Draper::Decorator
  delegate_all

  def name_or_email
    if name.present?
      return name
    else
      email.split('@')[0]
    end
  end

  # аналогичная запись
  # def name_or_email
  #   return name if name.present?
  #   email.split('@')[0]
  # end


end

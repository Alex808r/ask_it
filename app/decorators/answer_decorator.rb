class AnswerDecorator < Draper::Decorator
  delegate_all

  def formatted_created_at
    self.created_at.strftime('%Y-%m-%d %H:%M:%S') #self можно опустить
  end

end
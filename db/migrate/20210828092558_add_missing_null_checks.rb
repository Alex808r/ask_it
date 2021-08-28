class AddMissingNullChecks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :questions, :title, :false
    change_column_null :questions, :body,  :false
    change_column_null :answers,   :body,  :false
    # миграция добавляет проверку на уровне базы данных указанные поля в таблицах
    # должны быть заполнены.
  end
end

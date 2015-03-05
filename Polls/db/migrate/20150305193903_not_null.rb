class NotNull < ActiveRecord::Migration
  def change
    change_column :users, :user_name, :string, null: false
    change_column :polls, :title, :string, null: false
    change_column :questions, :body, :text, null: false
    change_column :answer_choices, :answer, :text, null: false
  end
end

class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.timestamps
    end

    create_table :polls do |t|
      t.string :title
      t.integer :user_id
      t.timestamps
    end

    create_table :questions do |t|
      t.text :body
      t.integer :poll_id
      t.timestamps
    end

    create_table :answer_choices do |t|
      t.text :answer
      t.integer :question_id
      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id
      t.integer :answer_choice_id
      t.timestamps
    end
  end
end

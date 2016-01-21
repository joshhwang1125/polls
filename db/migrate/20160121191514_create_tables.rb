class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
    end

    create_table :polls do |t|
      t.string :title
      t.integer :author_id
    end

    create_table :questions do |t|
      t.string :text
      t.integer :poll_id
    end

    create_table :answer_choices do |t|
      t.string :text
      t.integer :question_id
    end

    create_table :responses do |t|
      t.integer :user_id
      t.integer :answer_id
    end

    add_index :users, :user_name, :unique => true
    add_index :polls, :author_id
    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
    add_index :responses, :answer_id

  end
end

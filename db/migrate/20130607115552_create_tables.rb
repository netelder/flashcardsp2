class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    create_table :gamestats do |t|
      t.integer    :user_id
      t.integer    :correct_count
      t.integer    :incorrect_count
      t.timestamps
    end


    create_table :topics do |t|
      t.string  :name
      t.timestamps
    end

    create_table :cards do |t|
      t.integer :topic_id
      t.text    :question
      t.string  :answer
      t.timestamps
    end

  end
end

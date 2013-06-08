class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    create_table :rounds do |t|
      t.integer   :user_id
      t.integer   :deck_id
      t.integer    :guess_count
      t.integer    :correct_count
      t.integer    :incorrect_count
      t.timestamps
    end

    create_table :decks do |t|
      t.string :name
      t.timestamps
    end

    create_table :categories do |t|
      t.integer :deck_id
      t.integer :card_id
      t.string  :status
      t.timestamps
    end

    create_table :cards do |t|
      t.text    :question
      t.string  :answer
      t.timestamps
    end

  end
end

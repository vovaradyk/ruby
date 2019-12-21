class MigrateAll < ActiveRecord::Migration[6.0]
  def change
    drop_table :cities
    drop_table :teams
    drop_table :sponsors
    drop_table :players
    drop_table :users


    create_table :cities do |t|
      t.string :name
      t.string :state
      t.string :country
      t.string :timezone
      t.string :postcode

      t.timestamps
    end

      create_table :teams do |t|
      t.string :name
      t.belongs_to :city
      t.string :color
      t.integer :year
      t.belongs_to :sponsor
      t.float :budget

      t.timestamps
    end

    create_table :sponsors do |t|
      t.string :name
      t.string :address
      t.integer :payment
      t.string :phone

      t.timestamps
    end

    create_table :players do |t|
      t.string :name
      t.belongs_to :team
      t.string :position
      t.string :nation
      t.datetime :birthday
      t.float :height
      t.integer :weight
      t.timestamps
    end

    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end

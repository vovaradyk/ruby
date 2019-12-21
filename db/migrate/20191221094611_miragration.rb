class Miragration < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.string :country
      t.string :timezone
      t.string :postcode

      t.timestamps
    end

    create_table :companies do |t|
      t.string :name
      t.belongs_to :city
      t.string :address
      t.integer :year
      t.string :phone

      t.timestamps
    end

    create_table :deliveries do |t|
      t.datetime :date
      t.string :name
      t.belongs_to :city
      t.belongs_to :company
      t.integer :price
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

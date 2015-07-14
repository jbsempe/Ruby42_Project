class InitialSchema < ActiveRecord::Migration
  def up
    #Table Clients
    create_table :clients do |t|
      t.string :email

      t.timestamps null: false
    end

    #Table Packs
    create_table :packs do |t|
      t.attachment :image
      t.integer :quantity
      t.integer :format
      t.integer :ingraving
      t.integer :vinyl_colors
      t.integer :label
      t.integer :external_sleeve
      t.integer :sleeve
      t.integer :packaging
      t.integer :weight

      t.timestamps null: false
    end
    Pack.create_translation_table! title: :string, description: {type: :text, null: false}

    #Table Orders
    create_table :orders do |t|

      t.string :artist_name
      t.string :album_title
      t.string :label_name
      t.integer :num_cat
      t.integer :delivery_price
      t.string :status
      t.integer :total_price

      t.integer :quantity
      t.integer :format
      t.integer :ingraving
      t.integer :vinyl_colors
      t.integer :label
      t.integer :external_sleeve
      t.integer :sleeve
      t.integer :packaging
      t.integer :weight

      t.references :pack, index: true
      t.references :client, index: true
      t.timestamps null: false
    end
    add_foreign_key :orders, :packs
    add_foreign_key :orders, :clients


    #Table User
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end


  end
end





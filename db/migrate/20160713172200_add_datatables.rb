class AddDatatables < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name_of_gift
      t.integer :gift_value
      t.references :reindeer
      t.references :receiver
      t.boolean :delivered
      t.timestamps
    end

    create_table :reindeers do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.timestamps
    end

    create_table :children do |t|
      t.references :reindeer
      t.string :name
      t.integer :age
      t.string :address
      t.boolean :received
      t.timestamps
    end

  end
end

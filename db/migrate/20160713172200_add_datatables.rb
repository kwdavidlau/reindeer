class AddDatatables < ActiveRecord::Migration
  def change
    create_table :reindeers do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.timestamps
    end

    create_table :deliveries do |t|
      t.belongs_to :reindeer, index: true
      t.datetime :time_to_deliver
      t.boolean :delivery_status, default: false
    end

    create_table :gifts do |t|
      t.belongs_to :delivery, index: true
      t.string :name_of_gift
      t.integer :gift_value
      t.timestamps
    end

    create_table :children do |t|
      t.references :gift
      t.integer :age
      t.string :name
      t.string :address
      t.boolean :received
      t.timestamps
    end
  end
end

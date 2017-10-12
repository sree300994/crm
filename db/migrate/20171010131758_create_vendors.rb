class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :company
      t.string :website

      t.timestamps null: false
    end
  end
end

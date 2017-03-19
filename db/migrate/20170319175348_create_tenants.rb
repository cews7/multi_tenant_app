class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end

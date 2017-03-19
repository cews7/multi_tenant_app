class AddTenantIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :tenant, foreign_key: true
  end
end

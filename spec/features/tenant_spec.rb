require 'rails_helper'

RSpec.describe "Shop Tenants" do
  it 'descriminates between urls', js: true do
    tenant_1 = Tenant.create!(name: 'Apothecary', description: "Sells odds and ends", url: 'shop1.testing.com')
    tenant_1.products << Product.new(name: 'Dinosaur', description: "old as dirt")

    tenant_2 = Tenant.create!(name: 'SharpShop', description: "Sells odds and ends", url: 'shop2.testing.com')
    tenant_2.products << Product.new(name: 'Razor', description: "Very sharp")

    switch_to_subdomain 'shop1'
    visit '/products'

    expect(page).to have_content("Apothecary")
    expect(page).to have_content("Dinosaur")
    expect(page).to have_no_content("SharpShop")
    expect(page).to have_no_content("Razor")

    switch_to_subdomain 'shop2'
    visit '/products'

    expect(page).to have_no_content("Apothecary")
    expect(page).to have_no_content("Dinosaur")
    expect(page).to have_content("SharpShop")
    expect(page).to have_content("Razor")
  end
end

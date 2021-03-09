require 'rails_helper'

RSpec.feature "Visitor can add product to the cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "click 'Add' on product and it is added to the cart" do
    visit root_path

    within('nav') { expect(page).to have_content('My Cart (0)')}

    click_on('Add', match: :first)

    within('nav') { expect(page).to have_content('My Cart (1)')}

    save_screenshot('after_add.png')
  end
  
end

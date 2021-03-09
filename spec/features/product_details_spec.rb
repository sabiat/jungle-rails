require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page by clicking on a product", type: :feature, js: true do
  
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

  scenario "They click a product to get to product details" do

    visit root_path
    save_screenshot('homepage.png')
    find('.product header', match: :first).click
    sleep(1)
    expect(page).to have_css('.product-detail')
    save_screenshot('product.png')

  end
  

end

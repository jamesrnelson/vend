require 'rails_helper'

describe 'User visits snack page' do
  it 'should show the name of the snack and the price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sues  = owner.machines.create(location: "Sue's Happy Vending")
    snack1 = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
    snack2 = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
    snack3 = sues.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

    visit snack_path(snack1)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
  end
end

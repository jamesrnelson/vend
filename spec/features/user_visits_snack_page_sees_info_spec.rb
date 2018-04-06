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

describe 'User visits snack page' do
  it 'should show the vending machines that have that snack and their average snack price' do
    owner = Owner.create(name: "Sam's Snacks")

    snack1 = Snack.create(name: 'White Castle Burger', price: 3.50)

    dons = snack1.machines.create(location: "Don's Mixed Drinks", owner: owner)
    sues = snack1.machines.create(location: "Sue's Happy Vending", owner: owner)

    snack2 = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
    snack3 = sues.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)


    visit snack_path(snack1)
    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(dons.location)
    expect(page).to have_content(sues.location)
    expect(page).to have_content('Average price of snacks in this machine: 2.5')
    expect(page).to have_content('Average price of snacks in this machine: 3.0')

  end
end

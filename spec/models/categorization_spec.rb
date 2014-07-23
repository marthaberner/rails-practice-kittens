require 'rails_helper'

describe Categorization do
  it 'Validates the presence of a category' do
    categorization = Categorization.new(
      category: Category.new,
    )
    expect(categorization).to have(0).errors_on(:category)

    categorization.category = nil
    expect(categorization).to have(1).errors_on(:category)

  end

  it 'Validates the uniqueness of categories on a kitten' do
    kitten = Kitten.create!(image: 'some_image')
    category = Category.create!(name: 'Fuzzy')

    Categorization.create!(kitten_id: kitten.id, category: category)

    categorization = Categorization.new(category: category)
    expect(categorization).to have(0).errors_on(:category)

    categorization.kitten_id = kitten.id
    categorization.valid?
    expect(categorization.errors[:category]).to include("has already been taken")
  end
end
class Categorization < ActiveRecord::Base

  belongs_to :category

  validates :category, presence: true,  uniqueness: {scope: :kitten_id }
end
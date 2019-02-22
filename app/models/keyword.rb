class Keyword < ApplicationRecord
  belongs_to :shop
  has_many :search_results
end

class SearchResult < ApplicationRecord
  belongs_to :keyword
  has_many :search_ranks
end

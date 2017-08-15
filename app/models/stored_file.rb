class StoredFile < ApplicationRecord

  validates :filename, presence: true

end

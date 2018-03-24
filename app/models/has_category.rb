class HasCategory < ApplicationRecord
  belongs_to :article
  belongs_to :caregory
end

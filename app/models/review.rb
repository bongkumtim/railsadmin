class Review < ApplicationRecord
	belongs_to :user
	belongs_to :list
	belongs_to :offer
end

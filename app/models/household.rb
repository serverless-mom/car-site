class Household < ActiveRecord::Base
    has_many :people
    validates :zip, length: { minimum: 5}, presence: true
    validates :address, length: { minimum: 4, maximum: 255}, presence: true, uniqueness: true
    validates :state, presence: true, format: { with: /\A[a-zA-Z]{2,}\z/ } #regex: letters only, 2 or more
end

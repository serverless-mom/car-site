class Person < ActiveRecord::Base
    belongs_to :household
    has_many :vehicles
    validates :first_name, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than: 200}
end

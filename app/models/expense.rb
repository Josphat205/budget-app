class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups,class_name: 'Group'
  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

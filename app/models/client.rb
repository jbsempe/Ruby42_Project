class Client < ActiveRecord::Base
  has_many :orders

  attr_accessor :is_quote
  validates :email, presence: true, unless: :is_quote
end

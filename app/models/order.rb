class Order < ActiveRecord::Base
  delegate :price, :price_for, to: :price_calculation

  belongs_to :pack
  belongs_to :client

  accepts_nested_attributes_for :client

  paginates_per 10

  attr_accessor :is_quote

  validates :artist_name, presence: true, unless: :is_quote
  validates :album_title, presence: true, unless: :is_quote
  validates :label_name, presence: true, unless: :is_quote
  validates :num_cat, presence: true, unless: :is_quote

  include OrderProperties

  def self.new_from_pack(pack)
    new(pack: pack, format: pack.format, quantity: pack.quantity,
      client: Client.new, is_quote: true, ingraving: pack.ingraving,
      vinyl_colors: pack.vinyl_colors, label: pack.label,
      external_sleeve: pack.external_sleeve, sleeve: pack.sleeve,
      packaging: pack.packaging, weight: pack.weight)
  end

  def price_calculation
    @price_calculation ||= PriceCalculation.new(self)
  end
end
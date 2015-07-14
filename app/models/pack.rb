class Pack < ActiveRecord::Base
  has_many :orders

  paginates_per 10

  has_attached_file :image,
    default_url: "/missing_images/:style/missing.png",
    styles: {
      medium: "300x300>",
      thumb: "100x100>"
    }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :description, presence: true

  include OrderProperties

  translates :title, :description
  globalize_accessors attributes: [:title, :description]

  def price
    PriceCalculation.new(self).price
  end
end

module OrderProperties
  extend ActiveSupport::Concern

  included do
    validates :ingraving, presence: true
    validates :vinyl_colors, presence: true
    validates :label, presence: true
    validates :external_sleeve, presence: true
    validates :sleeve, presence: true
    validates :packaging, presence: true
    validates :weight, presence: true
    validates :quantity, presence: true
    validates :format, presence: true

    enum quantity: [:three_hundred, :five_hundred, :thousand]
    enum format: [:small, :large]
    enum ingraving: [:lacques, :seule]
    enum vinyl_colors: [:black, :color]
    enum label: [:white, :print]
    enum external_sleeve: [:not_poly, :poly]
    enum sleeve: [:without, :not_cardboard, :cardboard]
    enum packaging: [:without_p, :cellophanage, :pvc_sleeve]
    enum weight: [:standard, :heavy]
    enum status: [:discussion, :delivery_process, :deliver]
  end
end

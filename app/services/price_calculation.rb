class PriceCalculation
  REFERENCE_FILE_PATH = Rails.root.join('config/prices_reference.yml')

  def initialize(model)
    @model = model
  end

  def price
    settings[:quantity][@model.quantity] +
    settings[:format][@model.format] +
    settings[:ingraving][@model.ingraving] +
    settings[:vinyl_colors][@model.vinyl_colors] +
    settings[:label][@model.label] +
    settings[:external_sleeve][@model.external_sleeve] +
    settings[:sleeve][@model.sleeve] +
    settings[:packaging][@model.packaging] +
    settings[:weight][@model.weight]
  end

  def price_for(key)
    settings[key][@model.send(key)]
  end

  private

  def settings
    @settings ||= YAML.load(File.read(REFERENCE_FILE_PATH)).with_indifferent_access
  end
end
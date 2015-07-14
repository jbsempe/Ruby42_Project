module OrdersHelper
  def format_attributes_for_select
    Order.formats.keys.map do |format|
      [I18n.t("public.orders.formats.#{format}"), format]
    end
  end

  def quantity_attributes_for_select
    Order.quantities.keys.map do |quantity|
      [I18n.t("public.orders.quantities.#{quantity}"), quantity]
    end
  end

  def ingraving_attributes_for_select
    Order.ingravings.keys.map do |ingraving|
      [I18n.t("public.orders.ingravings.#{ingraving}"), ingraving]
    end
  end

  def vinyl_colors_attributes_for_select
    Order.vinyl_colors.keys.map do |vinyl_colors|
      [I18n.t("public.orders.vinyls_colors.#{vinyl_colors}"), vinyl_colors]
    end
  end

  def label_attributes_for_select
    Order.labels.keys.map do |label|
      [I18n.t("public.orders.labels.#{label}"), label]
    end
  end

  def external_sleeve_attributes_for_select
    Order.external_sleeves.keys.map do |external_sleeve|
      [I18n.t("public.orders.external_sleeves.#{external_sleeve}"), external_sleeve]
    end
  end

  def sleeve_attributes_for_select
    Order.sleeves.keys.map do |sleeve|
      [I18n.t("public.orders.sleeves.#{sleeve}"), sleeve]
    end
  end

  def packaging_attributes_for_select
    Order.packagings.keys.map do |packaging|
      [I18n.t("public.orders.packagings.#{packaging}"), packaging]
    end
  end

  def weight_attributes_for_select
    Order.weights.keys.map do |weight|
      [I18n.t("public.orders.weights.#{weight}"), weight]
    end
  end

  def status_attributes_for_select
    Order.statuses.keys.map do |status|
      [I18n.t("public.orders.statuses.#{status}"), status]
    end
  end
end

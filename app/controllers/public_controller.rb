class PublicController < ApplicationController
  layout "public"

  def default_url_options(options = nil)
    { locale: I18n.locale }
  end
end

module ApplicationHelper
  def paginate objects, options = {}
    options.reverse_merge!( theme: 'twitter-bootstrap-3', pagination_class: "pagination" )

    super( objects, options )
  end



  def slider_images
    images_file_path = Rails.root.join('config/images.yml')
    images ||= YAML.load(File.read(images_file_path)).with_indifferent_access
    images[:slider_images]
  end
end

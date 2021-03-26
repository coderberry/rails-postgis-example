    class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  argument :methods, type: :array, default: [], banner: "method method"
  class_option :module, type: :string

  def create_service_file
    @module_name = options[:module]
    @class_name  = class_name.downcase.include?("service") ? class_name : "#{class_name}Service"

    service_dir_path   = "app/services"
    generator_dir_path = service_dir_path + ("/#{@module_name.underscore}" if @module_name.present?).to_s
    generator_path     = generator_dir_path + "/#{@class_name.underscore}.rb"

    Dir.mkdir(service_dir_path)   unless File.exist?(service_dir_path)
    Dir.mkdir(generator_dir_path) unless File.exist?(generator_dir_path)

    template "service_template.rb", generator_path
  end
end


module SvgIconHelper
  def svg_icon(name)
    file_path = "#{Rails.root}/vendor/assets/images/icons/#{name}.svg"

    if File.exist?(file_path)
      File.read(file_path).html_safe
    else
      "(#{name} not found)"
    end
  end
end

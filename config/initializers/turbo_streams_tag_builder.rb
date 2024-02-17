ActiveSupport.on_load :turbo_streams_tag_builder do
  def redirect(path)
    action :redirect, path
  end
end

ActiveSupport.on_load :turbo_streams_tag_builder do
  def redirect(path)
    action :redirect, path
  end

  def close_modal(target = 'modal')
    action :close_modal, target
  end
end

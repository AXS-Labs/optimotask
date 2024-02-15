module ApplicationHelper
  def body_class
    [
      controller_path.parameterize,
      controller_path.parameterize + '__' + action_name
    ].join(' ')
  end
end

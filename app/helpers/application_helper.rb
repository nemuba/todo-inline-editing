module ApplicationHelper
  def render_toast(message, type)
    turbo_stream.replace(:toast, ToastComponent.new(message:, type:))
  end
end

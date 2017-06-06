class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_not_found
    render plain: 'Not found :(', status: :not_found
  end

  def render_forbidden
    return render text: 'Not Allowed >:O', status: :forbidden
  end
end

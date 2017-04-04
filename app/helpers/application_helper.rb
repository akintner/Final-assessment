module ApplicationHelper
   def page_is_login_or_create?
    current_uri(request) == "/login" || current_uri(request) == "/users/new" 
  end

  def current_uri(request)
    request.env['PATH_INFO']
  end
end

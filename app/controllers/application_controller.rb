class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method def current_tenant
    @tenant ||= Tenant.find_by!(url: request.host)
  end
end

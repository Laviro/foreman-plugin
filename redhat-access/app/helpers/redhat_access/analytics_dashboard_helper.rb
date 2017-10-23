module RedhatAccess
  module AnalyticsDashboardHelper
    include RedhatAccess::Telemetry::LookUps

    def help_path?
      Rails.logger.info("Helper path ? #{request.path == '/redhat_access/insights/help'}")
      request.path == '/redhat_access/insights/help'
    end

    def manage_path?
      Rails.logger.info("Manage path ? #{request.path == '/redhat_access/insights/manage'}")
      request.path == '/redhat_access/insights/manage'
    end

    def view_preconditions_met?
      if (help_path?)
        return true
      elsif (!is_org_selected?)
        return false
      elsif !telemetry_enabled?(Organization.current) && !manage_path?
        return false
      elsif !is_susbcribed_to_redhat?(Organization.current)
        return false
      elsif disconnected_org?(Organization.current)
        return false
      else
        return true
      end
    end
  end
end

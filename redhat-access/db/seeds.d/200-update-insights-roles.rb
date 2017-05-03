Role.without_auditing do
  insights_admin_role = Role.where(:name => "Access Insights Admin").first
  insights_viewer_role = Role.where(:name => "Access Insights Viewer").first
  view_host_perm = Permission.find_by_name(:view_hosts)
  if insights_admin_role
    insights_admin_role.add_permissions!(:view_hosts) unless insights_admin_role.has_permission?(view_host_perm)
  end
  if insights_viewer_role
    insights_viewer_role.add_permissions!(:view_hosts) unless insights_viewer_role.has_permission?(view_host_perm)
  end
end

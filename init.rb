require "redmine"

# Hooks
require "/usr/src/redmine/plugins/user_skills_plugin/lib/user_skills_plugin/hooks/user_profile_hook"

# Controller Patch
require "/usr/src/redmine/plugins/user_skills_plugin/lib/issues_controller_patch.rb"

# Load the controller
require "/usr/src/redmine/plugins/user_skills_plugin/app/controllers/user_skills_controller.rb"

Redmine::Plugin.register :user_skills_plugin do
  name "User Skills Plugin"
  author "HyperPixelv1"
  description "This plugin assigns the tags of the issues assigned to the user to the user's profile as the user's ability when the issue is done. When the buttons that ability tag in the user's profile are clicked, it shows the finished issues assigned to the user for that tag."
  version "0.0.1"
  author_url "https://github.com/HyperPixelv1"
end

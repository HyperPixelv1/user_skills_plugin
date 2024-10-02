require "redmine"
#require_relative "lib/user_skills_plugin/hooks/user_profile_hook"
# Hooks
require "/usr/src/redmine/plugins/user_skills_plugin/lib/user_skills_plugin/hooks/user_profile_hook"

# Controller Patch
require "/usr/src/redmine/plugins/user_skills_plugin/lib/issues_controller_patch.rb"

# Load the controller
require "/usr/src/redmine/plugins/user_skills_plugin/app/controllers/user_skills_controller.rb"

Redmine::Plugin.register :user_skills_plugin do
  name "User Skills Plugin"
  author "FYK"
  description "afsfs"
  version "0.0.1"
  url "http://example.com/path/to/plugin"
  author_url "http://example.com/about"
end

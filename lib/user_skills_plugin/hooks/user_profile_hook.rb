module UserSkillsPlugin
  module Hooks
    class UserProfileHook < Redmine::Hook::ViewListener
      render_on :view_users_show_bottom, partial: 'users/user_skills'
    end
  end
end

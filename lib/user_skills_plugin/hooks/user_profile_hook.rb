module UserSkillsPlugin
  module Hooks
    class UserProfileHook < Redmine::Hook::ViewListener
      def view_account_left_bottom(context = {})
        user = context[:user]
        skills = UserSkill.where(user: user)

        context[:controller].send(:render_to_string, {
          partial: "users/user_skills",
          locals: { skills: skills, user: user },
        })
      end
    end
  end
end

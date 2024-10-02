require_dependency "issues_controller"

module IssuesControllerPatch
  def self.included(base)
    base.class_eval do
      after_action :call_user_skills_update, only: [:update]
    end
  end

  private

  def call_user_skills_update
    return unless @issue.saved_change_to_status_id? && @issue.status.name&.casecmp("done")&.zero?

    # Kullanıcı yeteneklerini güncelleyen controller'ı çağır
    UserSkillsController.new.update_skills(@issue)
  end
end

# Patch'i uygulamak
IssuesController.send(:include, IssuesControllerPatch)

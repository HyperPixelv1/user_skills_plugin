class UserSkillsController < ApplicationController
  before_action :find_issue, only: [:update_skills]
  before_action :authorize_only, only: [:tagged_issue]
  before_action :require_login, only: [:tagged_issue]
  before_action :set_cache_headers, only: [:tagged_issue]

  def update_skills(issue)
    return unless issue && (issue.status.name.casecmp("done").zero? && issue.spent_hours >= 0.5)

    tags = issue.tag_list.to_a  # Burada tag_list'i diziye çeviriyoruz
    user = issue.assigned_to
    return unless user

    tags.each do |tag|
      user_skill = UserSkill.find_or_initialize_by(user_id: user.id, tag_name: tag.strip)
      user_skill.task_count = user_skill.task_count.to_i + 1
      if user_skill.save
        Rails.logger.info "Skill saved for User ID: #{user.id}, Tag: #{tag}, Task Count: #{user_skill.task_count}"
      else
        Rails.logger.error "Failed to save skill for User ID: #{user.id}, Tag: #{tag}, Errors: #{user_skill.errors.full_messages.join(", ")}"
      end
    end
    Rails.logger.info "Updated skills for User ID: #{user.id}, Tags: #{tags.join(", ")}"
  end

  def index
    @user = User.find(params[:id])
    @user_skills = UserSkill.where(user: @user)

    if @user_skills.any?
      Rails.logger.info "Displaying skills for User ID: #{@user.id}, Skills Count: #{@user_skills.count}"
    else
      Rails.logger.info "No skills available for User ID: #{@user.id}."
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error "User not found: #{e.message}"
    redirect_to users_path, alert: "User not found." # Kullanıcı bulunamazsa yönlendirme yap
  end

  private

  def find_issue
    @issue = Issue.find_by(id: params[:issue_id])
    unless @issue
      redirect_to root_path, alert: "Issue not found."
    end
  end
end

class UserSkillsController < ApplicationController
  unloadable

  def index
    @user = User.find(params[:user_id])

    # Etiketleri dinamik olarak çekiyoruz
    skills_query = AdditionalTag.joins("JOIN additional_taggings ON additional_taggings.tag_id = additional_tags.id")
                                .joins("JOIN (SELECT issue_id FROM time_entries WHERE user_id = #{@user.id} GROUP BY issue_id HAVING SUM(hours) > 1) AS te ON te.issue_id = additional_taggings.taggable_id")
                                .where("additional_taggings.taggable_type = ?", "Issue")
                                .group("additional_tags.name")
                                .count

    # Görünüme uygun formatlama
    @skills = skills_query.map do |tag_name, task_count|
      { tag_name: tag_name, task_count: task_count }
    end
  end
end

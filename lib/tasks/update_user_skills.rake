namespace :user_skills do
  desc "Update user skills based on completed issues in the past"
  task update_from_past_issues: :environment do
    # Tüm tamamlanmış görevleri bul
    completed_issues = Issue.where(status: IssueStatus.where(is_closed: true))

    completed_issues.each do |issue|
      next unless issue.assigned_to.present? && issue.tag_list.present?

      # tag_list'i diziye çevirip her etiketi döngüye alıyoruz
      issue.tag_list.to_a.each do |tag|
        skill = UserSkill.find_or_initialize_by(user: issue.assigned_to, tag_name: tag.strip)
        skill.task_count = (skill.task_count || 0) + 1
        if skill.save
          puts "Skill for #{skill.tag_name} saved successfully for user #{issue.assigned_to.name}."
        else
          puts "Error saving skill for #{issue.assigned_to.name}: #{skill.errors.full_messages.join(", ")}"
        end
      end
    end

    puts "All past issues processed."
  end
end

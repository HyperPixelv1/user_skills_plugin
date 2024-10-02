class TagsController < ApplicationController
  def tasks
    @tag = params[:id]
    @tasks = Issue.tagged_with(@tag)  # Tag'e ait görevleri almak için

    if @tasks.empty?
      Rails.logger.info "No tasks available for tag: #{@tag}."
    else
      Rails.logger.info "Displaying tasks for tag: #{@tag}, Count: #{@tasks.count}."
    end
  end
end

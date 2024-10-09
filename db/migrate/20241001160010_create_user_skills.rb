class CreateUserSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_skills do |t|
      t.integer :user_id
      t.string :tag_name
      t.integer :task_count
    end
    add_index :user_skills, :user_id
    add_index :user_skills, :tag_name
  end
end

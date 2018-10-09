class AddBadgeToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :badge, :string
    add_column :skills, :text, :string
  end
end

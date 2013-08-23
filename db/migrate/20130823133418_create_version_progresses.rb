class CreateVersionProgresses < ActiveRecord::Migration
  def self.up
    create_table :version_progresses do |t|
      t.column :spent_hours, :float
      t.column :percentage_done, :float
      t.column :version_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :version_progresses
  end
end

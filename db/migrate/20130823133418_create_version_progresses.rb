class CreateVersionProgresses < ActiveRecord::Migration
  def self.up
    create_table :version_progresses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :version_progresses
  end
end

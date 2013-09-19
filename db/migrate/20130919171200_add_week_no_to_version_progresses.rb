class AddWeekNoToVersionProgresses < ActiveRecord::Migration
  def self.up
    add_column :version_progresses, :week_no, :integer
  end

  def self.down

    remove_column :version_progresses, :week_no

  end
end
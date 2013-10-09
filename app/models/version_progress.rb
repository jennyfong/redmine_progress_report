class VersionProgress < ActiveRecord::Base

  belongs_to :version

  def self.record_progress(version=nil)
    if version

      VersionProgress.create!(:spent_hours => version.spent_hours, :percentage_done => version.completed_pourcent, :version => version)
    else
      Version.all(:conditions => "status = 'open'").each do |version|
        VersionProgress.create!(:week_no => DateTime.now.strftime('%U'),
                                :spent_hours => version.spent_hours,
                                :percentage_done => version.completed_pourcent,
                                :version => version)
      end
    end

  end

  def self.clean_duplicates
    Version.all(:conditions => "status = 'open'").each do |version|
      (1..52).each do |week_no|
        version_progress = VersionProgress.first(:conditions => ["version_id =? and week_no = ?", version.id, week_no])
        if version_progress
          VersionProgress.destroy_all(["version_id = ? and week_no =? and id <> ? ", version_progress.version_id, version_progress.week_no, version_progress.id])
        end

      end

    end
  end
end

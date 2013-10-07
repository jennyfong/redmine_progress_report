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
end

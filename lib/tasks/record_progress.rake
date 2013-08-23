namespace :progress_report do

  desc "Generate progress reports"
  task :record_progress => :environment do
    if !ENV['VERSION'].blank?
      version = Version.find(ENV['VERSION'])

      version_progress = VersionProgress.create(:spent_hours => version.spent_hours, :percentage_done => version.completed_pourcent, :version => version)

    else
      Version.all.each do |version|
        version_progress = VersionProgress.create(:spent_hours => version.spent_hours, :percentage_done => version.completed_pourcent, :version => version)
      end
    end
  end
end
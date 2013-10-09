namespace :progress_report do

  desc "Generate progress reports"
  task :record_progress => :environment do
    if !ENV['VERSION'].blank?
      version = Version.find(ENV['VERSION'])
      VersionProgress.record_progress(version)
    else
      VersionProgress.record_progress
    end
  end


  desc "remove duplicates"
  task :remove_duplicates => :environment do
    VersionProgress.clean_duplicates
  end

end
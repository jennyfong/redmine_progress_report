module VersionProgressesHelper

  def percentage_dev_days(spent_hour, estimated_dev_days)
    ((spent_hour/8)/estimated_dev_days.to_f)*100
  end
end

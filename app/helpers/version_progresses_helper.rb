module VersionProgressesHelper

  def percentage_dev_days(spent_hour, estimated_dev_days)
    unless estimated_dev_days.to_f == 0.0
      ((spent_hour/8)/estimated_dev_days.to_f)*100
    else
      0
    end

  end

  def display_date(date)
    date.strftime('%Y-%m-%d')
  end

  def display_percentage_done(percentage)
    percentage.to_f.round.to_s
  end

  def display_spent_days(hours)
    (hours/8).round(1).to_s
  end


  def version_progresses_to_csv(progresses, estimate_dev_days, options={})

    decimal_separator = l(:general_csv_decimal_separator)
    encoding = l(:general_csv_encoding)


    export = FCSV.generate(:col_sep => l(:general_csv_separator)) do |csv|
      # csv header fields

      csv << ['Date', '% Done', "% Dev Days", 'Dev Days']

      #csv lines

      progresses.each do |progress|
        csv << [display_date(progress.created_at), display_percentage_done(progress.percentage_done), display_percentage_done(percentage_dev_days(progress.spent_hours, estimate_dev_days)), display_spent_days(progress.spent_hours)]
      end

    end
    export
  end
end

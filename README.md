# Redmine Progress Report 

This plugin is specifically written to capture the percentage done and time spent on each active version of the projects. This allows project manage to plot graphs and generate reports to present progress to clients. 

Percentage is generated by retreiving the current percentage done by version. Time spent is generated by retreiving the total hours logged against a version.

## Functionalities

1. Capture Percentage Done By Version 
2. Capture Time Spent by Version
3. Rake task to capture the details of the version
4. Select the time peroid of the report
5. Generate CSV file of the report 

## Notes

1. The rake task only capture active versions, i.e. version that are 'opened', not 'closed' or 'locked'
2. A background job (e.g. cronjob) is required to run the rake task regularly to capture the progress of the report.
3. Cronjob template is provided in the plugin but it might need to be altered for different machines and settings. 

## Limitations

1. Minimal functionality is provided in this plugin for a very specific need from our Product Owner, therefore, there will be a limited validation on input fields.

## Installations

1. After installing the plugin under vendor/plugins
2. Run the plugin migration to create neccessary table (progress_reports)
`rake db:migrate:plugin NAME=redmine_progress_report`
3. Restart web server

## Instruction

1. Login to redmine as an adminstration
2. Go to Administration Tool
3. Select 'Progress Report' from the list
4. Select a project
5. Select a version
6. (Optional) Select a period, or beginning date, or leave it to default 'All'


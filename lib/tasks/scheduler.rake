namespace :scheduler do
  desc "TODO"

  task add_schedule: :environment do
    User.add_schedule_form
  end

  task list_schedule: :environment do
    User.next_week_schedule
  end

end

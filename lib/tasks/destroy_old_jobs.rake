namespace :destroy do
  task :old_jobs => :environment do
    Job.destroy_all.where("created_at < ? #{2.minutes.ago}")
    end
  end

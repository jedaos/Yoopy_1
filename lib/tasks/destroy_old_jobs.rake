namespace :destroy do
  task :old_jobs => :environment do
    Job.destroy_all.where("created_at < ? #{3.hours.ago}")
    end
  end

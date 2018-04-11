task :destroy_old_jobs => :environment do
    Job.expired.destroy_all
end

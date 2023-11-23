# lib/tasks/server.rake

namespace :server do
  desc 'Precompile assets and then start the server'
  task start: :environment do
    puts 'Precompiling...'
    Rake::Task['assets:precompile'].invoke
    Rake::Task['assets:clean'].invoke
    puts 'Starting Rails server...'
    exec 'rails s'
  end
end


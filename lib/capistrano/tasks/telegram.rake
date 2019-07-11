namespace :telegram do
  namespace :deploy do

    desc 'Notify about updating deploy'
    task :updating do
      Capistrano::Telegram.new(self).send(:updating)
    end

    desc 'Notify about reverting deploy'
    task :reverting do
      Capistrano::Telegram.new(self).send(:reverting)
    end

    desc 'Notify about updated deploy'
    task :updated do
      Capistrano::Telegram.new(self).send(:updated)
    end

    desc 'Notify about reverted deploy'
    task :reverted do
      Capistrano::Telegram.new(self).send(:reverted)
    end

    desc 'Notify about failed deploy'
    task :failed do
      Capistrano::Telegram.new(self).send(:failed)
    end

    desc 'Test Slack integration'
    task :test => %i[updating updated reverting reverted failed] do
      # all tasks run as dependencies
    end

  end
end

before 'deploy:updating',           'telegram:deploy:updating'
before 'deploy:reverting',          'telegram:deploy:reverting'
after  'deploy:finishing',          'telegram:deploy:updated'
after  'deploy:finishing_rollback', 'telegram:deploy:reverted'
after  'deploy:failed',             'telegram:deploy:failed'
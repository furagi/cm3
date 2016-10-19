#add two new tasks for non main dbs migration
task 'db:migrate', 'idcert:db:migrate', 'shared:db:migrate'

namespace :idcert do
  namespace :db do
    desc 'Migrates the idcert database'
    task :migrate => :environment do
      with_engine_connection_idcert do
        ActiveRecord::Migrator.migrate("#{File.dirname(__FILE__)}/../../db/idcert/migrate", ENV['VERSION'].try(:to_i))
      end
    end
  end
end

namespace :shared do
  namespace :db do
    desc 'Migrates the shared database'
    task :migrate => :environment do
      with_engine_connection_shared do
        ActiveRecord::Migrator.migrate("#{File.dirname(__FILE__)}/../../db/shared/migrate", ENV['VERSION'].try(:to_i))
      end
    end
  end
end


def with_engine_connection_idcert
  original = ActiveRecord::Base.remove_connection
  ActiveRecord::Base.establish_connection("#{ Rails.env }_idcert")
  yield
ensure
  ActiveRecord::Base.establish_connection(original)
end

def with_engine_connection_shared
  original = ActiveRecord::Base.remove_connection
  ActiveRecord::Base.establish_connection("#{ Rails.env }_shared")
  yield
ensure
  ActiveRecord::Base.establish_connection(original)
end

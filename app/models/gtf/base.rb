class Gtf::Base < ActiveRecord::Base
  self.abstract_class = true
  self.establish_connection "#{Rails.env}".to_sym
end

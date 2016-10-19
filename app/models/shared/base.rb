class Shared::Base < ActiveRecord::Base
  self.abstract_class = true
  self.establish_connection "#{Rails.env}_shared".to_sym
end

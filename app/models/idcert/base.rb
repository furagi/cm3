class Idcert::Base < ActiveRecord::Base
  self.abstract_class = true
  self.establish_connection "#{Rails.env}_idcert".to_sym
  default_scope ->{ order(:created => :desc) }
end

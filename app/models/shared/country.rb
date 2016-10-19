class Shared::Country < Shared::Base
  self.table_name = "country"
  belongs_to :currency, class_name: 'Shared::Currency'
end

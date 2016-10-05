class Gtf::Director < Gtf::Base
  self.table_name = "director"
  belongs_to :company, class_name: 'Gtf::Company'
end

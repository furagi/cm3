class Gtf::Label < Gtf::Base
  self.table_name = "label"
  belongs_to :company, class_name: "Gtf::Company"
end

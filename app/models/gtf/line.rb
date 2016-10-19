class Gtf::Line < Gtf::Base
  self.table_name = "line"
  belongs_to :company, class_name: "Gtf::Company"
  belongs_to :content, class_name: "Gtf::Content"
  belongs_to :label, class_name: "Gtf::Label"
end

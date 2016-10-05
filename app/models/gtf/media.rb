class Gtf::Media < Gtf::Base
  self.table_name = "media"
  belongs_to :company, class_name: "Gtf::Company"
  has_one :media, class_name: "Gtf::Media"
end

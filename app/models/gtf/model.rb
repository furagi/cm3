class Gtf::Model < Gtf::Base
  self.table_name = "model"
  belongs_to :agent, class_name: "Gtf::Agent"
  belongs_to :company, class_name: "Gtf::Company"
  belongs_to :content, class_name: "Gtf::Content"
  # belongs_to :country
  belongs_to :user, class_name: "Gtf::User"
end

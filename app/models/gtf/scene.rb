class Gtf::Scene < Gtf::Base
  self.table_name = "scene"
  default_scope ->{ order(:created => :desc) }
  before_create :set_created

  belongs_to :company, class_name: "Gtf::Company"
  belongs_to :content, class_name: "Gtf::Content"
  belongs_to :director, class_name: "Gtf::Director"
  # belongs_to :editor, class_name: "Gtf::Editor"
  belongs_to :line, class_name: "Gtf::Line"
  # belongs_to :studio, class_name: "Gtf::Studio"
  belongs_to :user, class_name: "Gtf::User"

  def set_created
    self.created = Time.now
  end
end

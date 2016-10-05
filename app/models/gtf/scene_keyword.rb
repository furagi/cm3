class Gtf::SceneKeyword < Gtf::Base
  belongs_to :company, class_name: "Gtf::Company"
end

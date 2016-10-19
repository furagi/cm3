class Gtf::SceneGenre < Gtf::Base
  self.table_name = "scene_genre"
  belongs_to :company, class_name: "Gtf::Company"
end

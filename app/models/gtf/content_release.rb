class Gtf::ContentRelease < Gtf::Base
  self.table_name = "content_release"
  belongs_to :website, class_name: 'Shared::Website'
  belongs_to :content, class_name: 'Gtf::Content'
end

class Gtf::ContentPriceRate < Gtf::Base
  self.table_name = "content_price_rate"
  belongs_to :content, class_name: "Gtf::Content"
end

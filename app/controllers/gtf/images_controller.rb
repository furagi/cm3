class Gtf::ImagesController < CommonController
  belongs_to :content

  private

    def image_params
      params.require(:image).permit()
    end
end


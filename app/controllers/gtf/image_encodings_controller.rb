class Gtf::ImageEncodingsController < CommonController

  private

    def image_encoding_params
      params.require(:image_encoding).permit()
    end
end


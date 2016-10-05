class Gtf::ImageEncodedsController < CommonController

  private

    def image_encoded_params
      params.require(:image_encoded).permit()
    end
end


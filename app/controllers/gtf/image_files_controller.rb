class Gtf::ImageFilesController < CommonController

  private

    def image_file_params
      params.require(:image_file).permit()
    end
end


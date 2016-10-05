class Gtf::UploadExtensionsController < CommonController

  private

    def upload_extension_params
      params.require(:upload_extension).permit()
    end
end


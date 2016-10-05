class Gtf::UploadsController < CommonController
  belongs_to :content

  private

    def upload_params
      params.require(:upload).permit()
    end
end


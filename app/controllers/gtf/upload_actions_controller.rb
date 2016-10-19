class Gtf::UploadActionsController < CommonController

  private

    def upload_action_params
      params.require(:upload_action).permit()
    end
end


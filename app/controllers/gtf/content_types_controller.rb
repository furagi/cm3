class Gtf::ContentTypesController < CommonController

  private

    def content_type_params
      params.require(:content_type).permit()
    end
end


class Gtf::MediaTypesController < CommonController

  private

    def media_type_params
      params.require(:media_type).permit()
    end
end


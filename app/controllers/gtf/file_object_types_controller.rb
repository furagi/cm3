class Gtf::FileObjectTypesController < CommonController

  private

    def file_object_type_params
      params.require(:file_object_type).permit()
    end
end


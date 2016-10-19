class Gtf::FileObjectTypeFamiliesController < CommonController

  private

    def file_object_type_family_params
      params.require(:file_object_type_family).permit()
    end
end


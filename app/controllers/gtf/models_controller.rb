class Gtf::ModelsController < CommonController

  private

    def model_params
      params.require(:model).permit()
    end
end


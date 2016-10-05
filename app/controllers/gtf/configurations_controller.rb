class Gtf::ConfigurationsController < CommonController

  private

    def configuration_params
      params.require(:configuration).permit()
    end
end


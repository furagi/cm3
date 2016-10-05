class Shared::CountriesController < InheritedResources::Base

  private

    def country_params
      params.require(:country).permit()
    end
end


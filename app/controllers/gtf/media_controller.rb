class Gtf::MediaController < CommonController

  private

    def medium_params
      params.require(:medium).permit()
    end
end


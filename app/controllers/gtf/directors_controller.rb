class Gtf::DirectorsController < CommonController

  private

    def director_params
      params.require(:director).permit()
    end
end


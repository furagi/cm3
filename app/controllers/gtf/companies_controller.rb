class Gtf::CompaniesController < CommonController

  private

    def company_params
      params.require(:company).permit()
    end
end


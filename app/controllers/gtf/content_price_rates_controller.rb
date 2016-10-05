class Gtf::ContentPriceRatesController < CommonController

  private

    def content_price_rate_params
      params.require(:content_price_rate).permit()
    end
end


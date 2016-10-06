class Idcert::WebsiteUsersController < CommonController

  private
    def permitted_params
      {
        :website_user => params.permit(:idcert_website_user => [
          :username,
          :last_name,
          :email,
          :first_name,
          :password,
          :created,
          :last_login,
          :logins,
          :active,
          :confirmation_code,
          :country_id,
          :currency_id,
          :birth_date,
          :last_fresh_id,
          :sex,
          :sexual_preferences,
          :vbulletin_id,
          :user_id,
          :tbdev_user_id,
          :feed_auto_subscription,
          :is_trusted,
          :external_user_id_i,
          :external_user_id_s,
          :notes,
          :password_update,
          :is_temporary_account,
          :player_mode,
          :poll
        ])[:website_user]
      }
    end
end

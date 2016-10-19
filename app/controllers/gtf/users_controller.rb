class Gtf::UsersController < CommonController

  private
    def permitted_params
      {:user => params.permit(:gtf_user => [
          :permission_group_id,
          :company_id,
          :username,
          :source_password,
          :source_password_confirmation,
          :name,
          :surname,
          :email,
          :phone,
          :mobile_phone,
          :description,
          :enabled,
          :disabled,
          :created,
          :last_login,
          :language,
          :ftp_password,
          :ftp_uid,
          :ftp_gid,
          :ftp_homedir,
          :ftp_shell,
          :ftp_expiration,
          :ftp_lastlogin,
          :ftp_lastlogout,
          :ftp_count,
          :reg_ip,
          :reg_ip_location,
          :hide_poll
        ])[:gtf_user]
      }
    end

end


module Spree
  module Admin
    class SocialController < Spree::Admin::BaseController
      def edit

      end

      def update
        Spree::Config[:facebook_app_id] = params[:social].delete(:facebook_app_id)
        params[:social].each do |provider, value|
          if value == '1'
            Spree::Config["#{provider}_button"] = true
          else
            Spree::Config["#{provider}_button"] = false
          end
        end

        redirect_to edit_admin_social_path, :notice => t("social_sharing_settings_updated")
      end
    end
  end
end

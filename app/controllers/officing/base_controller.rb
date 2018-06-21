class Officing::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :verify_officer

  skip_authorization_check

  def verify_officer
    raise CanCan::AccessDenied unless current_user.try(:poll_officer?)
  end

  private

    def check_officer_assignment
      if @officer_assignment.blank?
        go_back_to_new(t("officing.results.flash.error_wrong_booth"))
      end
    end
end

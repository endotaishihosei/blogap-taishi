class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # ログイン済みユーザのみにアクセスを許可する
  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.build_profile
  end
end
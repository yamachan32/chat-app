class UsersController < ApplicationController

  def edit
  end

  def update
    # current_user.update(user_params)
    # 条件式を判定する時点で、処理実行
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

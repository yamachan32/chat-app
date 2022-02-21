class RoomsController < ApplicationController

  def new
    @room = Room.new
  end
  
  def create
    # roomのインスタンス変数をストロングパラメータで作成
    @room = Room.new(room_params)

    # 新規room開設でtop_page
    if @room.save
      redirect_to root_path
    # 新規room errorで新規作成ページへリダイレクト errorパターンはなに？
    else
      render :new
    end
  end

  private

  def room_params
    # user_ids:[]でルームメンバーを複数名配列でストロングパラメータとして定義
    params.require(:room).permit(:name, user_ids: [])
  end

end

class Public::ChecksController < ApplicationController

  def new

    tired = params[:tired].to_i
    lightheadedness = params[:lightheadedness].to_i
    dizzy = params[:dizzy].to_i
    headache = params[:headache].to_i
    stiff_neck = params[:stiff_neck].to_i
    cold = params[:cold].to_i
    anemia = params[:anemia].to_i
    bring_up = params[:bring_up].to_i
    pulsation = params[:pulsation].to_i
    stomachache = params[:stomachache].to_i

    @result = tired + lightheadedness + dizzy + headache + stiff_neck + cold + anemia + bring_up + pulsation + stomachache

    @check = Check.new
    @checks = Check.all

  end

  def create
    @check = Check.new(check_params)
    @check.user_id = current_user.id
    
    @check.attributes.keys.each do |question|
      @check[question] ||= "no" unless question == "id" || question == "user_id"
    end

    if @check.save
      flash[:notice] = "回答が保存されました。"
      redirect_to check_path(@check.id)
    else
      flash[:notice] = "回答の保存に失敗しました。"
      render :new
    end
  end

  def show
    @check = Check.find(params[:id])

    tired = @check.tired
    lightheadedness = @check.lightheadedness
    dizzy = @check.dizzy
    headache = @check.headache
    stiff_neck = @check.stiff_neck
    cold = @check.cold
    anemia = @check.anemia
    bring_up = @check.bring_up
    pulsation = @check.pulsation
    stomachache = @check.stomachache

    @result = tired + lightheadedness + dizzy + headache + stiff_neck + cold + anemia + bring_up + pulsation + stomachache

  end

  private
  # ストロングパラメータ
  def check_params
    params.require(:check).permit(:name, :email, :image, :tired, :lightheadedness, :dizzy, :headache, :stiff_neck, :cold, :anemia, :bring_up, :pulsation, :stomachache)
  end

end

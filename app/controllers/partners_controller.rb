class PartnersController < ApplicationController

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_to root_path
    else
      redirect_to kanri_new_path
    end
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def update
    @partner = Partner.find(params[:id])
    if @partner.update(partner_params)
      flash[:notice] = "パートナー情報が更新されました！"
      redirect_to kanri_path
    else
      render 'edit'
    end
  end

  def destroy
    partner = Partner.find(params[:id])
    partner.destroy
    flash[:notice] = "パートナー情報が削除されました！"
    redirect_to kanri_path
  end

  private

  def partner_params
    params.require(:partner).permit(:partner_image, :link, :name, :tag_id, :published)
  end

end

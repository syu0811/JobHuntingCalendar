class CompaniesController < ApplicationController
  before_action :sign_in_required, only: [:show, :new, :create, :destroy]

  def show
    @companies = Company.where(user: params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(current_user), notice: '作成に成功'
    else
      render :new
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy!
      redirect_to companies_path, notice: '削除に成功'
    else
      redirect_to companies_path, notice: '削除に失敗'
    end
  end

  private

  def company_params
    @params = params.require(:company).permit(:name)
    @params[:user_id] = current_user.id
    @params
  end
end

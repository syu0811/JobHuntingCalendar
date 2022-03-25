class CompaniesController < ApplicationController
  before_action :sign_in_required, only: [:index, :new]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: '作成に成功'
    else
      render :new
    end
  end

  private

  def company_params
    @params = params.require(:company).permit(:name)
    @params[:user_id] = current_user.id
    @params
  end
end

class SecretsController < ApplicationController
  before_action :authenticate_member!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @secrets = Secret.all
  end

  def new
    @secret = Secret.new
  end

  def create
    @secret = current_member.secrets.build(secret_params)
    if @secret.save
      redirect_to @secret, notice: "Your secret was created"
    else
      render :new
    end
  end

  def show
    @secret = Secret.find(params[:id])
  end

  def edit
    @secret = Secret.find(params[:id])
  end

  def update
    @secret = Secret.find(params[:id])
    if @secret.update(secret_params)
      redirect_to @secret, notice: "Your secret was updated"
    else
      render :edit
    end
  end

  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to secrets_path, notice: "Your secret was deleted"
  end

  private

  def secret_params
    params.require(:secret).permit(:title, :body)
  end
end

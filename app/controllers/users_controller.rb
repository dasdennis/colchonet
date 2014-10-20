class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    params.permit! # Rails 4 protege os atributos do model, isso força com que ele os permita.
    @user = User.new(params[:user]) # (params[:user])   ---- (user_params) 
    if @user.save
      redirect_to @user,
        :notice => 'Cadastro realizado com sucesso!'
    else
      render :new
    end
  end
  # Solução para corrigir erros como os:
  # ActiveModel::ForbiddenAttributesError when creating new user
  # undefined method `attr_accessible' for #<Class:xxxxxx>
  # private

  # def user_params
  #   params.require(:user).permit(:bio, :email, :full_name, :location, :password)
  # end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    params.permit!
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'Cadastro atualizado com sucesso!'
    else
      render :update
    end
  end
end
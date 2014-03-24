class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      #redirect_to_target_or_default root_url, :notice => "Sesion Iniciada Correctamente."
      redirect_to root_url
    else
      flash.now[:alert] = "Login o Contraseña Invalido."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Usted acaba de cerrar Sesion."
  end
end

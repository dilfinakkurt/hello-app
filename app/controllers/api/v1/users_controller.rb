class Api::V1::UsersController < ApplicationController
  # CSRF korumasını atla
  skip_before_action :verify_authenticity_token
  
  # POST, PATCH/PUT gibi aksiyonlardan önce User nesnesini bulmak için
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  # Tüm kullanıcıları listeler
  def index
    @users = User.all
    render json: @users
  end

  # GET /api/v1/users/:id
  # Belirli bir kullanıcıyı gösterir (İlişkili gönderiler ve yorumlar dahil)
  def show
    # İlişkili gönderileri ve yorumları dahil etmek için includes kullanıyoruz.
    @user = User.includes(:posts, :comments).find(params[:id])
    render json: @user, include: [:posts, :comments]
  end

  # POST /api/v1/users
  # Yeni bir kullanıcı oluşturur
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/:id
  # Mevcut bir kullanıcıyı günceller
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:id
  # Belirli bir kullanıcıyı siler
  def destroy
    @user.destroy
    head :no_content
  end

  private

  # Tekrar eden koddan kaçınmak için User nesnesini bulma metodu
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  # Güvenlik için izin verilen parametreleri tanımlıyoruz
  # NOT: Password/Password_confirmation gibi alanlar buraya eklenmelidir.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation) 
  end
end
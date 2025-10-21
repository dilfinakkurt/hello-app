class Api::V1::CommentsController < ApplicationController
  # CSRF korumasını atla
  skip_before_action :verify_authenticity_token
  
  # POST, PATCH/PUT gibi aksiyonlardan önce Comment nesnesini bulmak için
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /api/v1/comments
  # Tüm yorumları listeler (Gönderi ve Kullanıcı ilişkileri dahil)
  def index
    @comments = Comment.includes(:post, :user).all
    render json: @comments, include: [:post, :user]
  end
  
  # GET /api/v1/comments/:id
  # Belirli bir yorumu detaylarıyla gösterir
  def show
    render json: @comment, include: [:post, :user]
  end

  # POST /api/v1/comments
  # Yeni bir yorum oluşturur
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/comments/:id
  # Mevcut bir yorumu günceller
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/comments/:id
  # Belirli bir yorumu siler
  def destroy
    @comment.destroy
    head :no_content
  end

  private

  # Tekrar eden koddan kaçınmak için Comment nesnesini bulma metodu
  def set_comment
    @comment = Comment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Comment not found" }, status: :not_found
  end

  # Güvenlik için izin verilen parametreleri tanımlıyoruz
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
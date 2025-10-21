class Api::V1::TagsController < ApplicationController
  # CSRF korumasını atla
  skip_before_action :verify_authenticity_token
  
  # POST, PATCH/PUT gibi aksiyonlardan önce Tag nesnesini bulmak için
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /api/v1/tags
  # Tüm etiketleri listeler
  def index
    @tags = Tag.all
    render json: @tags
  end

  # GET /api/v1/tags/:id
  # Belirli bir etiketi gösterir (İlişkili gönderiler dahil)
  def show
    @tag = Tag.includes(:posts).find(params[:id])
    render json: @tag, include: [:posts]
  end

  # POST /api/v1/tags
  # Yeni bir etiket oluşturur
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created
    else
      render json: { errors: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tags/:id
  # Mevcut bir etiketi günceller
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: { errors: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tags/:id
  # Belirli bir etiketi siler
  def destroy
    @tag.destroy
    head :no_content
  end

  private

  # Tekrar eden koddan kaçınmak için Tag nesnesini bulma metodu
  def set_tag
    @tag = Tag.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Tag not found" }, status: :not_found
  end

  # Güvenlik için izin verilen parametreleri tanımlıyoruz
  def tag_params
    params.require(:tag).permit(:name)
  end
end
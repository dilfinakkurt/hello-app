class Api::V1::CategoriesController < ApplicationController
  # CSRF korumasını atla
  skip_before_action :verify_authenticity_token
  
  # POST, PATCH/PUT gibi aksiyonlardan önce Category nesnesini bulmak için
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /api/v1/categories
  # Tüm kategorileri listeler
  def index
    @categories = Category.all
    render json: @categories
  end

  # GET /api/v1/categories/:id
  # Belirli bir kategoriyi gösterir (İlişkili gönderiler dahil)
  def show
    # İlişkili gönderileri dahil etmek için includes kullanıyoruz.
    @category = Category.includes(:posts).find(params[:id])
    render json: @category, include: [:posts]
  end

  # POST /api/v1/categories
  # Yeni bir kategori oluşturur
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/categories/:id
  # Mevcut bir kategoriyi günceller
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/categories/:id
  # Belirli bir kategoriyi siler
  def destroy
    @category.destroy
    head :no_content
  end

  private

  # Tekrar eden koddan kaçınmak için Category nesnesini bulma metodu
  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Category not found" }, status: :not_found
  end

  # Güvenlik için izin verilen parametreleri tanımlıyoruz
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
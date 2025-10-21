class Api::V1::PostsController < ApplicationController
  # Bu bir API olduğu için, gelen isteklerde CSRF (Cross-Site Request Forgery) korumasını atlıyoruz.
  skip_before_action :verify_authenticity_token
  
  # POST, PATCH/PUT gibi aksiyonlardan önce Post nesnesini bulmak için
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /api/v1/posts
  # Tüm gönderileri listeler (Kullanıcı, Kategori ve Etiket ilişkileri dahil)
  def index
    # N+1 sorununu önlemek için includes() kullanıyoruz.
    @posts = Post.includes(:user, :category, :tags).all
    # Yanıtı JSON formatında döndürürken ilişkili verileri de dahil ediyoruz.
    render json: @posts, include: [:user, :category, :tags]
  end

  # GET /api/v1/posts/:id
  # Belirli bir gönderiyi detaylarıyla gösterir
  def show
    render json: @post, include: [:user, :category, :comments, :tags]
  end

  # POST /api/v1/posts
  # Yeni bir gönderi oluşturur
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/posts/:id
  # Mevcut bir gönderiyi günceller
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/:id
  # Belirli bir gönderiyi siler
  def destroy
    @post.destroy
    # Başarılı silme yanıtı (204 No Content)
    head :no_content
  end

  private

  # Tekrar eden koddan kaçınmak için Post nesnesini bulma metodu
  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end

  # Güvenlik için izin verilen parametreleri tanımlıyoruz (Strong Parameters)
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_id)
  end
end

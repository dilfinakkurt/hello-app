class ApplicationController < ActionController::Base
  # Rails 7+ API modu için bu callback'in tanımını ekliyoruz.
  # Bu, diğer controller'larda 'skip_before_action' kullanabilmemizi sağlar.
  # Eğer bu projede API dışında bir şey kullanmayacaksak, direkt burada atlayabiliriz.
  
  # Ödeviniz API üzerine kurulu olduğu için, bu korumayı direkt olarak
  # tüm uygulama genelinde devre dışı bırakıyoruz.
  
  protect_from_forgery with: :null_session
  
  # Not: Normalde burada session bazlı korumalar tanımlanır.
end

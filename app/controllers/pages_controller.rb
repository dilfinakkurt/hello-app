# app/controllers/pages_controller.rb

class PagesController < ApplicationController
  def hello
    # Artık burada render plain kullanmayacağız.
    # Rails otomatik olarak app/views/pages/hello.html.erb dosyasını arayacak.
  end
end
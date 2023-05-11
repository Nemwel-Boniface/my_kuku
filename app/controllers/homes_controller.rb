class HomesController < ApplicationController
  def index
    @blogs = Blog.all
    @images = {
      image1: 'farmimg1.jpg',
      image2: 'farmimg2.jpg',
      image3: 'farmimg3.jpg',
      image4: 'farmimg4.jpg',
      image5: 'farmimg5.jpg',
      image6: 'farmimg6.jpg',
      image7: 'farmimg7.jpg',
      image8: 'farmimg8.jpg'
    }
  end
end

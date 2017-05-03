class PhotosController < ApplicationController

def new_form
  render("photos/new_form.html.erb")
end

def create_row
  url = params[:da_source]
  cap = params[:da_caption]
  new_photo = Photo.new
  new_photo.source = url
  new_photo.caption = cap
  new_photo.save
  # render("photos/create_row.html.erb")
  redirect_to("/photos")
end

def index
  @list_of_all_my_photos = Photo.all
  render("photos/index.html.erb")
end

def show
  the_id = params[:da_id]
  @my_photo = Photo.find(the_id)
  render("photos/show.html.erb")
end

def edit_form
  @photo = Photo.find(params[:id])
  # @the_id = params[:da_id]
  # render("photos/edit_form.html.erb")
end

def update_row
  @photo = Photo.find(params[:id])

  @photo.caption = params[:caption]
  @photo.source = params[:source]

  @photo.save

  # render("photos/update_row.html.erb")
  redirect_to("/photos/#{@photo.id}")
end

def destroy_row
  render("photos/destroy_row.html.erb")
end

end

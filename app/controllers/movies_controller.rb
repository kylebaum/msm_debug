class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
      @movie = Movie.find_by({ :id => params[:id] })

  end

  def new_form
  end

  def create_row
    create = Movie.new
    create.title = params[:title]
    create.year = params[:year]
    create.duration = params[:duration]
    create.description = params[:description]
    create.image_url = params[:image_url]
    create.director_id = params[:director_id]
    create.save

    redirect_to("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie = Movie.find_by({ :id => params[:id] })
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    render("show")
  end

  def destroy
   @movie = Movie.find_by({ :id => params[:id] })
   @movie.destroy


  end
end

class ArtistsController < ApplicationController

    before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
        @paintings_count = params[:paintings].to_i || 3
        @paintings_count.times { @artist.paintings.build }
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to @artist
        else
            render :new
        end
    end

    private
    def artist_params
        params.require(:artist).permit(
            :name,
            paintings_attributes: [:title]
            )
    end

    def find_artist
        @artist = Artist.find(params[:id])
    end

end

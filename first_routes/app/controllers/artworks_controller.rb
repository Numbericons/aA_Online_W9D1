class ArtworksController < ApplicationController

    def index
        artwork_all = Artwork.all
        render json: artwork_all
    end

    def create
        artwork = Artwork.new(artwork_params)
        
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    private
    def artwork_params
        params.require(:artworks).permit(:image_url, :title, :artist_id)
    end
end
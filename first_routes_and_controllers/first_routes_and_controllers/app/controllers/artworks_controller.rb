class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all
        render json: artworks
    end 

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        incoming_wildcard = params[:id]
        answer = Artwork.find_by(id:incoming_wildcard)
        if !answer
            render json: "Artwork not found"
        else
            render json: answer
        end
    end

    def update
        incoming_wildcard = params[:id]
        located_artwork = Artwork.find_by(id:incoming_wildcard)
        if !located_artwork 
            render json: "Artwork not found"
        elsif !located_artwork.update!(artwork_params)
            render json: located_artwork.errors.full_messages, status: :unprocessable_entity 
        else
            redirect_to artwork_url(located_artwork.id)   
        end
    end

    def destroy
        incoming_wildcard = params[:id]
        located_artwork = Artwork.find_by(id:incoming_wildcard)
        if !located_artwork 
            render json: "Artwork not found"
        else
            located_artwork.destroy
            render json: located_artwork
        end

    end


    private 
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end


#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
end

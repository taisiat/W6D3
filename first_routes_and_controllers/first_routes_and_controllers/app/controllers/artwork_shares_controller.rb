require "byebug"

class ArtworkSharesController < ApplicationController
    def create
        
        artwork_share = ArtworkShare.new(artwork_share_params)
        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        incoming_artwork_share_id = params[:id]
        located_artwork_share = ArtworkShare.find_by(id:incoming_artwork_share_id)
        if !located_artwork_share 
            render json: "ArtworkShare not found"
        else
            located_artwork_share.destroy
            render json: located_artwork_share
        end

    end

    private 
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end



end

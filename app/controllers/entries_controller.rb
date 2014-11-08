class EntriesController < ApplicationController
    def search
    end

    def get_results 
      key = params[:data][:key]
      results = Entry.order(:word).where('word ILIKE ?', "#{key}%").limit(10).pluck(:word)
      respond_to do |format|
        format.json { render json: results and return }
      end
    end
end

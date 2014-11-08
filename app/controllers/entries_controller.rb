class EntriesController < ApplicationController
    def search
      key = params[:data][:key]
      results = Entry.where('word ILIKE ?', "#{key}%").limit(10).pluck(:word)
      respond_to do |format|
        format.json { render json: results and return }
      end
    end
end

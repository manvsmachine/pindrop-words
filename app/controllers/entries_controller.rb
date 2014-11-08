class EntriesController < ApplicationController
    def search
    end

    def get_results 
      key = params[:data][:key]
      results = Entry.where('word ILIKE ?', "#{key}%").order('LOWER(word)').limit(10).pluck(:word)
      respond_to do |format|
        format.json { render json: results and return }
      end
    end
end

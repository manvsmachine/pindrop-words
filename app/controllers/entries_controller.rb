class EntriesController < ApplicationController
    def search
    end

    def get_results 
      if params[:data]
        key = params[:data][:key]
        if key.nil? || key.eql?('') 
          results = []
        else
          results = Entry.where('word ILIKE ?', "#{key}%").order('LOWER(word)').limit(10).pluck(:word)
        end

        respond_to do |format|
          format.json { render json: results and return }
        end
      else
        render nothing: true, status: 400 and return
      end
    end
end

require 'rails_helper'

RSpec.describe 'search attempt', :type => :request do
  before(:all) do
    Entry.delete_all
    File.open('/usr/share/dict/words', 'r') do |file|
      file.readlines[0...200].map { |word| word.strip }.uniq.each do |line|
        Entry.create!(word: line)
      end
    end
  end

  after(:all) do
    Entry.delete_all
  end

  describe 'POST #search' do
    it 'should return up to 10 matching entries for a search term' do
      @expected_results  = ['Ab',
                            'aba',
                            'Ababdeh',
                            'Ababua',
                            'abac',
                            'abaca',
                            'abacate',
                            'abacay',
                            'abacinate',
                            'abacination'].to_json
        
      get '/search', format: :json, data: { key: 'ab' }
      expect(response.body).to eq(@expected_results)
    end
  end
end

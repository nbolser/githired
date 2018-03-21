require 'rails_helper'

RSpec.describe SearchesController, type: :request do
  describe 'GET /searches' do
    before do
      get searches_path
    end

    it 'returns a 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'is HTML' do
      expect(response.content_type).to eq('text/html')
    end
  end

  describe 'POST /searches' do
    let(:search_post_params) { { search: { keyword: 'rails' } } }

    before do
      post '/searches', xhr: true, params: search_post_params
    end

    it 'returns a 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'is text/javascript' do
      expect(response.content_type).to eq('text/javascript')
    end

    it 'creates a Search record' do
      expect(Search.count).to eq(1)
    end

    context 'without search params' do
      let(:search_post_params) { nil }

      it 'returns a 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'is text/html' do
        expect(response.content_type).to eq('text/html')
      end

      it 'does not create a Search record' do
        expect(Search.count).to eq(0)
      end
    end
  end
end

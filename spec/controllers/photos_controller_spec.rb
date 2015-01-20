require 'rails_helper'

describe PhotosController do
  let(:json_response) { JSON.parse(response.body) }

  describe 'GET index' do
    it 'gets all photos' do
      Photo.create(url: 'http://localhost/img1.gif')
      Photo.create(url: 'http://localhost/img2.gif')

      get :index

      expect(json_response['photos'].length).to eq(2)
      expect(json_response['photos'][0]['url']).to eq('http://localhost/img1.gif')
      expect(json_response['photos'][1]['url']).to eq('http://localhost/img2.gif')
    end
  end

  describe 'GET show' do
    it 'gets the photo' do
      photo = Photo.create(url: 'http://localhost/img1.gif')

      get :show, id: photo.id

      expect(json_response['photo']['url']).to eq('http://localhost/img1.gif')
    end
  end
end

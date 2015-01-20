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

  describe 'PUT update' do
    let(:user) { User.create(
      name: 'Test User',
      email: 'test@example.com',
      password: 'password'
    ) }
    let(:album) { Album.create(user: user, name: 'My Album') }
    let(:page) { Page.create(album: album, layout: 1) }
    let(:photo) { Photo.create(url: 'http://localhost/old.png', page: page) }

    subject {
      put :update, {
        id: photo.id,
        photo: {
          url: 'http://localhost/new.png',
          shape: 'rounded',
          offset_left: -10,
          offset_top: 0
        }
      }
    }

    describe 'when user is logged out' do
      it 'has status 401' do
        subject
        expect(response).to have_http_status(401)
      end
    end

    describe 'when user is logged in' do
      before do
        ApplicationController.any_instance.stub(current_user: user)
      end

      it 'updates all attributes' do
        subject

        expect(response.status).to eq(200)

        photo.reload
        expect(photo.url).to eq('http://localhost/new.png')
        expect(photo.shape).to eq('rounded')
        expect(photo.offset_left).to eq(-10)
        expect(photo.offset_top).to eq(0)
      end
    end
  end
end

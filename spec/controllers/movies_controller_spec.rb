require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  # VERB 'action'
  describe "GET 'index'" do
    it "is successful" do
      # verb :action
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders a new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    let(:movie) do
      Movie.create(name: "Test", director: "Me", description: "boring film", rank: 7)
    end

    it "renders the show view" do
      get :show, id: movie.id
      expect(subject).to render_template :show
    end
  end

  describe "POST 'create'" do
    let(:movie) do
      {
        movie: {
          name: "Test",
          director: "Me",
          description: "boring film",
          rank: 7
        }
      }
    end

    let(:bad_movie) do
      {
        movie: {
          name: "Test",
          director: "Me",
          description: nil,
          rank: 7
        }
      }
    end

    it "redirects to movies index page" do
      post :create, movie
      expect(subject).to redirect_to movies_path
    end

    it "redirects to movies index on error" do
      post :create, bad_movie
      expect(subject).to redirect_to movies_path
    end
  end

  describe "GET 'edit'" do
    let(:movie) do
      Movie.create(name: "Test", director: "Me", description: "boring film", rank: 7)
    end

    it "renders edit view" do
      get :edit, id: movie.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'update'" do
    let(:movie) do
    Movie.create(name: "Test", director: "Me", description: "boring film", rank: 7)
    {
      id: 1,
      movie: {
        name: "Test",
        director: "Me",
        description: "boring film",
        rank: 7
      }
    }
    end

    let(:bad_movie) do
    Movie.create(name: nil, director: "Me", description: "boring film", rank: 7)
    {
      id: 1,
      movie: {
        name: nil,
        director: "Me",
        description: "boring film",
        rank: 7
      }
    }
    end

    it "redirects to movies index page" do
      patch :update, movie
      expect(subject).to redirect_to movies_path
    end

    it "redirects to movies index on error" do
      post :create, bad_movie
      expect(subject).to redirect_to movies_path
    end
  end

  describe "DELETE 'destroy'" do
    let(:movie) do
      Movie.create(name: "Test", director: "Me", description: "boring film", rank: 7)
      {
        movie: {
          name: "Test",
          director: "Me",
          description: "boring film",
          rank: 7
        }
      }
    end

    it "redirects to movies index page" do
      delete :destroy, id: movie.id
      expect(subject).to redirect_to movies_path
    end
  end
end

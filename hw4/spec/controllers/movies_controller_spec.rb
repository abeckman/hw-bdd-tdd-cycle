require 'spec_helper'

describe MoviesController do
  describe 'find with same director' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
      FactoryGirl.create(:movie, :title => 'ThX-1138', :rating => 'R', :director => "George Lucas")
      FactoryGirl.create(:movie, :title => 'Star Wars', :rating => 'PG', :director => "George Lucas")
      FactoryGirl.create(:movie, :title => 'Blade Runner', :rating => 'PG', :director => "Ridley Scott")
      FactoryGirl.create(:movie, :title => 'Alien', :rating => 'R', :director => "")
    end 
    context 'when the specified movie has a director' do
      it 'should call the model method to find movies with a director match' do
        expect(Movie).to receive(:find_with_same_director).with("1").
          and_return(@fake_results)
        post :search_director, {:id => "1"}
      end
    end
    context 'when the specified movie has no director' do
      it 'should select the Index Results template for rendering' do
        post :search_director, {:id => 4}
        expect(response).to redirect_to '/movies'
      end
    end
  end
end

require 'spec_helper'

describe Movie do
  describe 'searching by one movies director' do
    before :each do
      FactoryGirl.create(:movie, :title => 'ThX-1138', :rating => 'R', :director => "George Lucas")
      FactoryGirl.create(:movie, :title => 'Star Wars', :rating => 'PG', :director => "George Lucas")
      FactoryGirl.create(:movie, :title => 'Blade Runner', :rating => 'PG', :director => "Ridley Scott")
      FactoryGirl.create(:movie, :title => 'Alien', :rating => 'R', :director => "")
    end 
    it 'should find movies by the same director' do
      expect(Movie.where(director: "George Lucas").length).to eq(2)
      Movie.find_with_same_director(1)
    end
    it 'should not find movies by different directors' do
      Movie.where(director: "George Lucas").each { |movie|
        expect(movie.director).to_not eq("Ridley Scott")
        expect(movie.director).to_not eq("")
      }
      Movie.find_with_same_director(1)
    end
  end
end

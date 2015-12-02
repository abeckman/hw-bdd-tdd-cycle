class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_with_same_director(id)
    directed = Movie.find(id).director
    return {} if directed.blank?
    Movie.where(director: "#{directed}")
  end
end

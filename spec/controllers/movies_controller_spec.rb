require 'spec_helper'

describe MoviesController do
  describe 'edit page for appropriate Movie' do
    it 'When I go to the edit page for the Movie, it should be loaded' do
      mock = mock('Movie')
      Movie.should_receive(:find).with('13').and_return(mock)
      get :edit, {:id => '13'}
      response.should be_success
    end
    it 'And I fill in "Director" with "Ridley Scott", And  I press "Update Movie Info", it should save the director' do
      mock = mock('Movie')
      mock.stub!(:update_attributes!)
      mock.stub!(:title)
      mock.stub!(:director)
      mock2 = mock('Movie')
      Movie.should_receive(:find).with('13').and_return(mock)
      mock.should_receive(:update_attributes!)
      post :update, {:id => '13', :movie => mock2 }
    end

    it 'When I follow "Find Movies With Same Director", I should be on the Similar Movies page for the Movie' do
      mock = mock('Movie')
      mock.stub!(:director).and_return('mock director')
      similarMocks = [mock('Movie'), mock('Movie')]
      Movie.should_receive(:find).with('13').and_return(mock)
      Movie.should_receive(:find_all_by_director).with(mock.director).and_return(similarMocks)
      get :similar, {:id => '13'}
    end
    it 'should show Movie by id' do
      mock = mock('Movie')
      Movie.should_receive(:find).with('13').and_return(mock)
      get :show, {:id => '13'}
    end
  end
end


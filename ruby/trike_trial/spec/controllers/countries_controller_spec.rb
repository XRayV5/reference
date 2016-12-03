require "rails_helper"

describe CountriesController do

  describe "shipping_rates" do
    let(:code)           { "AU" }
    let!(:country)       { FactoryGirl.create :country, :code => code }
    before(:each)        { FactoryGirl.create :country, :code => "US" }

    subject(:shipping_rates) { get :shipping_rates, :country_code => code, :format => :json }

    it { is_expected.to be_successful }

    describe "response body" do
      subject(:response_body) { shipping_rates; JSON.parse(response.body) }
      specify { expect(response_body["regular"]).to eq country.regular_shipping_rate }
      specify { expect(response_body["express"]).to eq country.express_shipping_rate }
    end
  end

  describe "Get index" do


    let(:countries) { Country.all }
    before(:example) {get :index,  :format => :json}

    describe "it returns all countries" do
      it "assigns all countries to @countries" do
        # get :index
        expect(assigns['countries']).to eq(countries)
      end

      it "will get a 200 response" do
        expect(response).to have_http_status(:ok)
      end

      it "renders the json object" do
        expect(response.body).to eq(countries.to_json)
      end

      # subject(:index) { get :index, :format => :json }
      #
      # it { is_expected.to be_successful }
      #
      # describe "response body" do
      #   let(:countries) { Country.all }
      #
      #   subject(:response_body) { index; response.body}
      #   #binding.pry
      #   specify { expect(response_body).to eq countries.to_json }
      # end
    end
  end


  describe "show coutries first" do
    subject(:country_first) {get :country_first, id: 91}
    let(:first) {Country.find(91)}
    #subject(:index) { get :index, :format => :json }

    it { is_expected.to be_successful }

    describe "response body" do

      subject(:response_body) { country_first; response.body}
      #binding.pry
      specify { expect(response_body).to eq first.to_json }
    end
  end

  describe "show countries by code" do
    let(:code)           { "AU" }
    # let!(:country)       {2.times { FactoryGirl.create :country, :code => code}}
    # before(:each)        { FactoryGirl.create :country, :code => "US" }
    before(:each)        {3.times { FactoryGirl.create :country, :code => "US"}}
    before(:each)        {2.times { FactoryGirl.create :country, :code => code}}
    let(:country)       { Country.where(code: code) }

    # it { is_expected.to be_successful }
    # binding.pry
    subject(:country_by_code) {get :show_by_code, :country_code => code}

    it { is_expected.to be_successful }

    describe "response_body" do

      subject(:response_body) { country_by_code; response.body}

      specify { expect(response_body).to eq country.to_json}
      # specify { expect(JSON.parse(response_body).count).to eq country.count}
    end
  end


  # Test Update: PUT - 2 ways:


  describe "update rate" do
    before :each do
      @country_to_update = FactoryGirl.create :country
    end


    it "changes the country's attributes" do
      put :update, id: @country_to_update,
          regular_shipping_rate: 53,
          express_shipping_rate: 54
      @country_to_update.reload
      expect(assigns(:updated_country).regular_shipping_rate.to_i).to eq 53
      expect(assigns(:updated_country).express_shipping_rate.to_i).to eq 54
    end


  end

  describe "PUT update/:id" do
    let(:attr) do
      { :regular_shipping_rate => 53, :express_shipping_rate => 54 }
    end

    before :each do
      @country_to_update = FactoryGirl.create :country
      put :update, params: {:id => @country_to_update.id, :regular_shipping_rate => attr[:regular_shipping_rate],
      :express_shipping_rate => attr[:express_shipping_rate]}
      @country_to_update.reload
    end

    # it { response.should redirect_to(@country_to_update) }
    it { expect(@country_to_update.regular_shipping_rate.to_i).to eq attr[:regular_shipping_rate] }
    it { expect(@country_to_update.express_shipping_rate.to_i).to eq attr[:express_shipping_rate] }
  end

  describe "POST CREATE" do

    context "CREATE with valid attrs" do

      before :each do
        @country_to_create = FactoryGirl.attributes_for(:country)
        post :create, params: @country_to_create, :format => :json
        # binding.pry
        # parsed_response = JSON.parse(response.body)
      end

      # it { is_expected.to be_successful }
      it "will get a 200 response" do
        expect(response).to have_http_status(:ok)
      end
      it { expect(Country.count).to eq 1 }
      it { expect(JSON.parse(response.body).to_h).to eq(@country_to_create) }

    end
  end

end


# rails db:seed RAILS_ENV=test --trace #populate test data to database
#  bundle exec rspec spec/controllers/countries_controller_spec.rb:43
# rspec spec/controllers/countries_controller_spec.rb:43
# RAILS_ENV=test rails c

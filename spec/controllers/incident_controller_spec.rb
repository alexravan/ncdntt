require 'rails_helper'

describe IncidentsController do
  describe "GET #index" do
    it "populates an array of incidents" do 
      incident = FactoryGirl.create(:incident)
      get :index
      expect(assigns(:incidents)).to eq([incident])
    end 
    it "renders the :index view" do 
      get :index
      expect(response).to render_template :index
    end 
  end
  
  describe "GET #show" do
    it "assigns the requested incident to @incident" do 
      incident = FactoryGirl.create(:incident)
      get :show, id: incident
      expect(assigns(:incident)).to eq(incident)
    end 
    it "renders the :show template" do 
      get :show, id: FactoryGirl.create(:incident)
      expect(response).to render_template :show
    end 
  end

  
  describe "GET #new" do
    it "assigns a new Incident to @incident" do 
      get :new
      expect(assigns(:incident)).to be_a_new(Incident)
    end 
    it "renders the :new template" do 
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new incident in the database" do 
        expect {
          post :create, incident: FactoryGirl.attributes_for(:incident)          
        }.to change(Incident, :count).by(1)
      end 
      it "redirects to the new incident" do
        post :create, incident: FactoryGirl.attributes_for(:incident)
        expect(response).to redirect_to Incident.last
      end 
    end
    
    context "with invalid attributes" do
      it "does not save the new incident in the database" do
        expect {
          post :create, incident: FactoryGirl.attributes_for(:invalid_incident)
        }.to_not change(Incident, :count)
      end 
      it "re-renders the :new template" do
        post :create, incident: FactoryGirl.attributes_for(:invalid_incident)
        expect(response).to render_template :new
      end
    end
  end
end 
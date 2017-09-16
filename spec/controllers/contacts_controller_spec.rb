require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "GET index" do
		it "assigns @contacts" do
			contact1 = Contact.create!(name: "Andy", email: "andy@abc.com")
			contact2 = Contact.create!(name: "Mandy", email: "mandy@abc.com")
			contact3 = Contact.create!(name: "Randy", email: "randy@abc.com")
			contact3 = Contact.create!(name: "Sandy", email: "sandy@abc.com")
			
      contacts = Contact.all
      get :index
      expect(assigns(:contacts).count).to eq(contacts.count)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

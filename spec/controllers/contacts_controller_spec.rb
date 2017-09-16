require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
	
	let(:attributes) do
		{
			name: "Dusty",
			email: "dusty@abc.com",
			phone: "212-413-2411",
			address: "24 Main St., Boise, ID"
		}
	end
	
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

  it "renders the show template" do
    contact = Contact.create!(attributes)
    get :show, id: contact.id
    expect(response).to render_template(:show)
  end

  describe "creation" do
    before { post :create, contact: attributes }
    let(:contact) { Contact.find_by(name: "Dusty") }
 
    it "creates a new contact" do
      expect(contact).to_not be_nil
    end
 
    it "redirects to the contact's show page" do
      expect(response).to redirect_to(contact_path(contact))
    end
  end
end

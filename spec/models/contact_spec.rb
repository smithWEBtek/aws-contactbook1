require 'rails_helper'

RSpec.describe Contact, type: :model do

	let(:attributes) do
		{
			name: "Randy",
			email: "asdf@asdf.com",
			phone: "603-414-2241",
			address: "24 Servant St., Bedford, NH"
		}
	end

	it 'is an Object' do
		expect(Contact.class).to eq(Class)
	end

	it 'has a name' do 
		contact1 = Contact.create(name: "Buford")
		expect(contact1.name).to eq("Buford")
	end
	
	it "can sort by name" do
		contact1 = Contact.create!(name: "Andy", email: "andy@abc.com")
		contact2 = Contact.create!(name: "Mandy", email: "mandy@abc.com")
		contact3 = Contact.create!(name: "Randy", email: "randy@abc.com")
		contact3 = Contact.create!(name: "Sandy", email: "Sandy@abc.com")
		expect(Contact.last.name).to eq("Sandy")
	end

	it 'has a phone' do 
		contact2 = Contact.create(name: "Buford", phone: "603-444-5111")
		expect(contact2.phone).to eq("603-444-5111")
	end

	it 'has an email' do 
		contact2 = Contact.create(name: "Buford", phone: "603-444-5111", email: "asdf@asdf.com")
		expect(contact2.email).to eq("asdf@asdf.com")
	end

	it 'has a unique email' do 
    contact1 = Contact.create!(name: "Andy", email: "same@abc.com")
    contact2 = Contact.new(name: "Mandy", email: "same@abc.com")
		expect(contact2.save).to eq(false)
	end
	
  let(:missing_email) { attributes.except(:email) }
  it "is invalid without a email" do
    expect(Contact.new(missing_email)).not_to be_valid
  end
 
end
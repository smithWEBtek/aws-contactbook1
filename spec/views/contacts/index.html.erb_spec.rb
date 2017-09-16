require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
	it "displays all the contacts" do
    assign(:contacts, [
			Contact.create!(name: "Andy", email: "andy@abc.com"),
			Contact.create!(name: "Mandy", email: "mandy@abc.com"),
			Contact.create!(name: "Randy", email: "randy@abc.com", phone: "555-333-2312")
    ])
		render
    expect(rendered).to match(/555-333-2312/)
	end
end

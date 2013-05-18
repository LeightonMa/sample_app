# require 'spec_helper'

# describe "StaticPages" do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_pages_index_path
#       response.status.should be(200)
#     end
#   end
# end
require 'spec_helper'

  describe "Static pages" do
  	
    subject { page }
    describe "Home page" do  
      before { visit root_path }
      it { should have_selector('h1', text: 'Sample App')}
      it { should have_selector 'title', text: full_title('')}
      it { should have_selector 'title', text: '| Home'}

      describe "for signed-in users" do
        let(:user) {FactoryGirl.create(:user)}
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
          sign_in user
          visit root_path
        end

        it "should render the user's feed" do
          user.feed.each do |item|
            page.should have_selector("li##{item.id}", text: item.content)
          end
        end
      end
    end

  describe "Help page" do
  	it "should have the content 'Help'" do
  		visit help_path
  		page.should have_content('Help')
  	end
  end

  describe "About page" do
  	it "should have the content 'About us'" do
  		visit about_path
  		page.should have_content('About Us')
  	end
  end

  describe "Contact page" do
     before {visit contact_path}
     it {should have_selector('h1', text: 'Contact')}
     it {should have_selector('title', text: full_title('Contact'))}
  end
end


shared_examples_for "multi_params" do

  describe "allows many elements to share the same form name in array style syntax", :focus => true do
    before do
      @session.visit('/form')
    end
    it "without clobbering" do
      @session.check('form_soup_spicy')
      @session.check('form_soup_mushrooms')
      @session.check('form_soup_bamboo_shoots')
      @session.choose('soup_gluten-free')
      @session.fill_in('form_special_request', :with =>'Bow to the soup please')
      @session.fill_in('form_order_number',    :with =>'94')
      @session.select('Soba',       :from => 'form_soup_addon')

      @session.click_button "awesome"
      
      soup=extract_results(@session)["soup"]
      soup.should have(7).entries
    end
  end
end

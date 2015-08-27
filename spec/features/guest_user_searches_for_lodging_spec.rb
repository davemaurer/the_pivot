require 'rails_helper'

feature 'Guest user searches for lodging' do
  scenario 'on home page, not logged in' do
    visit root_path
    select('Asia', from: 'location')
    page.execute_script %Q{ $('#from').trigger("focus") } # activate datetime picker
    page.execute_script %Q{ $("a.ui-state-default:contains('15')").trigger("click") } # click on day 15
    page.execute_script %Q{ $('#to').trigger("focus") } # activate datetime picker
    page.execute_script %Q{ $("a.ui-state-default:contains('16')").trigger("click") } # click on day 16

    click_button 'Search'

    expect(current_path).to eq(listings_path)
    expect(page).to have_content('Asia')
  end
end

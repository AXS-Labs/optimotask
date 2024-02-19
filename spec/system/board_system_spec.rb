require "rails_helper"

describe "Boards management", type: :system do
  before do
    sign_in create(:user)
  end

  describe 'a logged in user' do
    scenario "can create a new board" do
      visit account_boards_path

      click_on I18n.t('account.boards.index.new')

      within '.modal' do
        fill_in I18n.t('activerecord.attributes.board.title'), with: "New Board"
        click_button :commit
      end

      expect(page).to have_text("New Board")
    end
  end
end

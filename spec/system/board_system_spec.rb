require "rails_helper"

describe "Boards management", type: :system do
  let(:user) { create(:user) }

  before do
    sign_in user
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

    scenario "can rename a board" do
      board = create(:board, title: 'Existing Board', organization: user.organizations.last)
      visit account_boards_path

      within "##{dom_id(board)}" do
        within '.dropdown' do
          click_link
        end
      end
      click_on I18n.t('account.boards.boards.edit')

      within '.modal' do
        fill_in I18n.t('activerecord.attributes.board.title'), with: "Changed Name"
        click_button :commit
      end

      within "##{dom_id(board)}" do
        expect(page).to have_link("Changed Name")
      end
    end

    scenario "can delete a board" do
      board = create(:board, title: 'Existing Board', organization: user.organizations.last)
      visit account_boards_path

      within "##{dom_id(board)}" do
        within '.dropdown' do
          click_link
        end
      end
      click_on I18n.t('account.boards.boards.delete')

      within '.modal' do
        click_link I18n.t('account.boards.confirm_destroy.confirm')
      end

      expect(page).not_to have_link("Existing Board")
    end
  end
end

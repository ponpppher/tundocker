require 'rails_helper'

describe '本の登録機能', type: :system do
  describe '一覧表示' do
    before do
      # make User
      user_a = FactoryBot.create(:user)
      # registrate book by user
      book = FactoryBot.build(:book) 
      book.save(validate: false)
      # byebug
    end
    context 'ユーザーログイン時' do
      before do
        # login with user
        visit new_user_session_path
        fill_in 'email', with: 'testmail@gmail.com'
        fill_in 'user_password', with: 'password'
        click_button 'Log in'
        expect(page).to have_content '本一覧'
      end

      it 'ユーザーが登録した本が一覧に表示される' do
        # confirm display book registed by user
        visit new_book_path
        fill_in 'タイトル', with: 'rails step up guide'
        fill_in 'ページ数', with: '55'
        fill_in '価格', with: '111115'
        attach_file '本のサムネイル', "#{Rails.root}/spec/factories/book_sample1.jpg"
        fill_in '関連タグ', with: "rails,ruby"
        click_button '登録する'

        expect(page).to have_content 'rails step up guide'
        expect(find('img.book-image')[:src]).to have_content "book_sample1.jpg"
      end
    end
  end
end
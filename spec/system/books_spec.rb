require 'rails_helper'

describe '本の登録機能', type: :system do
  describe '一覧表示' do
    before do
      # make User
      user_a = FactoryBot.create(:user)
      # registrate book by user
      book = FactoryBot.build(:book) 
      book.save(validate: false)
      byebug
      visit new_user_session_path
    end
    context 'ユーザーログイン時' do
      before do
        # login with user
        # fill_in 'email', with: 'a@example.com'
        # fill_in 'password', with: 'password'
      end

      it 'ユーザーが登録した本が表示される' do
        # confirm display book registed by user
      end
    end
  end
end
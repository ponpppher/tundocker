require 'rails_helper'

describe 'ユーザーの登録機能', type: :system do
  let(:test_user) { FactoryBot.build(:user, name: 'user alpha', email: 'alpha@example.com') }
  let(:create_user) { FactoryBot.create(:user, name: 'user beta', email: 'beta@example.com') }

  describe 'sign up' do

    before do
      visit new_user_registration_path
      fill_in 'ユーザー名', with: login_user.name
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      fill_in '確認用パスワード', with: login_user.password
      click_button 'Sign up'
    end

    context '新規ユーザーを登録する' do
      let(:login_user) { test_user }
      it '本の一覧ページが表示される' do
        expect(page).to have_content '本一覧'
      end
    end

    context 'メールアドレスが存在する時' do
      let(:login_user) { create_user }
      it 'メールアドレスが存在すると表示される' do
        expect(page).to have_content 'メールアドレスはすでに存在します'
      end
    end
  end

  describe 'log in' do

    before do
      visit new_user_session_path
      fill_in 'email', with: login_user.email
      fill_in 'user_password', with: login_user.password
      click_button 'Log in'
    end

    context '作成したユーザーでログイン' do
      let(:login_user) { create_user }
      it '本の一覧ページが表示される' do
        expect(page).to have_content '本一覧'
      end
    end

    context 'パスワードを間違えた時' do
      let(:login_user) { FactoryBot.build(:user, password: 'unmatchpassword')}
      it 'ログイン失敗' do
        expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
      end
    end
  end

end

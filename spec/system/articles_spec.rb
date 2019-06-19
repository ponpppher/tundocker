require 'rails_helper'

describe '記事の投稿機能', type: :system do
  let(:create_user) { FactoryBot.create(:user) }
  let(:build_book) { FactoryBot.build(:book, title: 'one book') }
  let(:regist_book) { FactoryBot.create(:regist_book, user: create_user) }
  let(:create_article) { FactoryBot.create(:article, title: '20190619memo', user: create_user)}

  before do
    visit new_user_session_path
    fill_in 'email', with: login_user.email
    fill_in 'user_password', with: login_user.password
    click_button 'Log in'
  end
  describe '記事を作成する' do
    let(:login_user) { create_user }
    let!(:regist) { regist_book }
    let!(:article) { create_article }

    before do
      regist
      article.book = login_user.books.first
      article.save
    end

    context 'ログイン時' do
      it '記事が追加できる' do
        visit books_path
        expect(page).to have_content '20190619memo'
      end

      it '記事を参照できる' do
        visit books_path
        click_on '20190619memo'
        expect(page).to have_content '概要'
      end
    end
  end
end

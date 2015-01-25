require 'rails_helper'

describe 'ログアウト' do
	before do
		visit signup_path
		fill_in 'ユーザ名', with: 'test'
		fill_in 'パスワード', with: 'password'
		fill_in 'パスワード(確認)', with: 'password'
		click_button '登録'
		click_link 'ログアウト'
	end

	it 'ログアウトをクリックするとログアウトする' do
		expect(page).to have_content 'ログイン'
		expect(page).to have_content '新規登録'
		expect(page).not_to have_content 'ログアウト'
	end

	it 'ログアウトするとログインページにリダイレクトする' do
		expect(current_path).to eq login_path
	end
end
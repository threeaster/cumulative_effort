require 'rails_helper'

describe 'ログイン' do
	before do
		visit signup_path
		fill_in 'ユーザ名', with: 'test'
		fill_in 'パスワード', with: 'password'
		fill_in 'パスワード(確認)', with: 'password'
		click_button '登録'
		click_link 'ログアウト'
		visit login_path
		fill_in 'ユーザ名', with: 'test'
		fill_in 'パスワード', with: 'password'
	end

	it 'ユーザ名とパスワードを正しく入力すればログインできる' do
		click_button 'ログイン'
		expect(page).to have_content 'ログアウト'
		expect(page).not_to have_content 'ログイン'
		expect(page).not_to have_content '新規登録'
	end

	it 'ログインするとトップにリダイレクトされる' do
		click_button 'ログイン'
		expect(current_path).to eq root_path
	end
end
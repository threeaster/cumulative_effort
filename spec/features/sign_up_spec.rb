require 'rails_helper'

describe 'ユーザ登録' do
	before do
		visit signup_path
		fill_in 'ユーザ名', with: 'test'
		fill_in 'パスワード', with: 'password'
		fill_in 'パスワード(確認)', with: 'password'
	end

	it 'ユーザ名とパスワードと確認を正しく入力すれば、ユーザが作られること' do
		click_button '登録'
		expect(User.count).to eq 1
		expect(User.find_by(name: 'test')).not_to eq nil
	end

	it 'ユーザ登録に成功すればヘッダーにログアウトが表示され、新規登録やログインが表示されない' do
		click_button '登録'
		expect(page).to have_content 'ログアウト'
		expect(page).not_to have_content 'ログイン'
		expect(page).not_to have_content '新規登録'
	end

	it 'ユーザ登録に成功した時、トップページにリダイレクトされる' do
		click_button '登録'
		expect(current_path).to eq root_path
	end
end
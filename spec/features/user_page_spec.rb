require 'rails_helper'

describe 'ユーザページ' do
	before do
		@user = create :user, name: 'name'
		login @user
	end

	describe '表示' do
		it 'ユーザページには名前が表示される' do
			visit user_path @user
			expect(page).to have_content 'name'
		end
	end
end
module LoginMacros
	def login user
		visit login_path
		fill_in 'ユーザ名', with: user.name
		fill_in 'パスワード', with: user.password
		click_button 'ログイン'
	end
end
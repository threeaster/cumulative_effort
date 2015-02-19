require 'rails_helper'

describe 'history' do
  subject{ page }
  let(:user){ create :user }
  let(:effort){ create :effort, user: user }
  before do
    login user
  end

  it 'createで回数などを記録すると、記録とともにその日がdateに設定される' do
    visit new_effort_history_path effort.id
    fill_in '今日の努力', with: 10
    click_button '記録'
    todays_history = History.find_by effort: effort
    expect(todays_history.quantity).to eq 10
    expect(todays_history.date).to eq Date.today
  end
end
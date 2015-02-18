require 'rails_helper'

describe 'effor' do
  subject{ page }
  let(:user){ create :user }
  before do
    login user
  end

  it 'createページでeffortを作ることができる' do
    visit new_user_effort_path(user.id)
    fill_in '名前', with: '努力'
    select '回数', from: 'effort_effort_type'
    fill_in '単位', with: '回'
    click_button '作成'
    expect(Effort.all.size).to eq 1
  end

  it 'showページで個々のeffortを読むことができる' do
    effort = create :effort
    visit effort_path effort.id
    should have_content effort.name
    should have_content effort.unit
  end
end
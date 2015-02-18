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
    all = Effort.all
    expect(all.size).to eq 1
    expect(all[0].user).to eq user
  end

  it 'showページで個々のeffortを読むことができる' do
    effort = create :effort_with_user
    visit effort_path effort.id
    should have_content effort.name
    should have_content effort.unit
  end

  describe '#index' do
    let!(:another_user){ create :user }
    let!(:effort){ create :effort, user: user }
    let!(:effort2){ create :effort, user: user }
    let!(:effort_by_another_user){ create :effort, user: another_user }

    it '自分のeffortの一覧を見ることができる' do
      visit user_efforts_path user.id
      should have_content effort.name
      should have_content effort2.name
      should_not have_content effort_by_another_user.name
    end

    it '各effortをクリックすることでそのeffortのshowに飛べる' do
      visit user_efforts_path user.id
      click_link effort.name
      should have_content effort.name
      should_not have_content effort2.name
    end
  end
end
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'should save successfully' do
      user = User.new(email: 'example@gmail.com', password: '1234567').save
      expect(user).to eq(true)
    end

    it 'should have failed if a param is missing' do
      user = User.new(email: 'example@gmail.com').save
      expect(user).to eq(false)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with a name shorter than 4 characters' do
      user.name = 'Joe'
      expect(user).not_to be_valid
    end

    it 'is not valid with a name longer than 50 characters' do
      user.name = 'a' * 51
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with an invalid email' do
      user.email = 'invalid_email'
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with a password shorter than 8 characters' do
      user.password = 'short'
      expect(user).not_to be_valid
    end

    it 'is not valid with a password longer than 50 characters' do
      user.password = 'a' * 51
      expect(user).not_to be_valid
    end
  end

  context 'associations' do
    it 'has many tasks' do
      association = described_class.reflect_on_association(:tasks)
      expect(association.macro).to eq :has_many
    end
  end
end

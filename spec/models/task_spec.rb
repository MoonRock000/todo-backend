# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { create(:user) }
  let(:task) { build(:task, user: user) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(task).to be_valid
    end

    it 'is not valid without a description' do
      task.description = nil
      expect(task).not_to be_valid
    end

    it 'is not valid with a description shorter than 4 characters' do
      task.description = 'abc'
      expect(task).not_to be_valid
    end

    it 'is not valid with a description longer than 100 characters' do
      task.description = 'a' * 101
      expect(task).not_to be_valid
    end

    it 'is not valid without a user' do
      task.user = nil
      expect(task).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end

  context 'enum status' do
    it 'can have a status of pending' do
      task.status = :pending
      expect(task).to be_valid
      expect(task.status).to eq('pending')
    end

    it 'can have a status of complete' do
      task.status = :complete
      expect(task).to be_valid
      expect(task.status).to eq('complete')
    end
  end
end

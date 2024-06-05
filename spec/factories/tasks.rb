# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    description { 'This is a task description.' }
    status { :pending }
    association :user
  end
end

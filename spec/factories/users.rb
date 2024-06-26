# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'john.doe@example.com' }
    password { 'password123' }
  end
end

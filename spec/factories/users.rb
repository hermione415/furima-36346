FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '123abc' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '隆太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birthday              { '2000-01-01' }
  end
end
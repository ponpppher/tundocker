FactoryBot.define do
    factory :article do
      user
      book
      title { 'sample article' }
      body {
          '概要
          プログラミングなどの学習をする際に参考書などを買って満足することがある人のためのサイト
          消化していく本のみ登録し学習した内容を書き出していくことで積読を解消します。
          '
      }
    end
end
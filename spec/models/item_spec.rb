require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能の実装' do
    context '商品情報がデータベースに保存される場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報がデータベースに保存されない場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.items_information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items information can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須であること' do
        @item.item_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it '配送料の負担の情報が必須であること' do
        @item.shipcost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipcost can't be blank")
      end
      it '発送元の地域の情報が必須であること' do
        @item.shiparea_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shiparea can't be blank")
      end
      it '発送までの日数の情報が必須であること' do
        @item.daystoship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Daystoship can't be blank")
      end
      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipcost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipcost can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.shiparea_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shiparea can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.daystoship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Daystoship can't be blank")
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = '1000000000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

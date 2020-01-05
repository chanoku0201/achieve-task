class Task < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  # データベース上でnot nullとしたカラムはモデル上でもバリデーション設定しておいた
  validates :name, presence: true, length: { maximum: 30 }
  validates :text, presence: true, length: { maximum: 1500 }
  validates :level, presence: true
  validates :priority, presence: true
  validates :genre_id, presence: true
  # statusカラムの番号を3つの文字列状態として紐づけて定義
  enum status: {
    START: 0,
    DOING: 1,
    COMPLETED: 2
  }

  def change_status!
    if START?
      DOING!
    else
      START!
    end
  end

  def change_completed!
    if START? || DOING?
      COMPLETED!
    end
  end
  enum level: {
    ★: 1,
    ★★: 2,
    ★★★: 3,
    ★★★★: 4,
    ★★★★★: 5,
    ★★★★★★: 6,
    ★★★★★★★: 7,
    ★★★★★★★★: 8,
  }
  enum priority: {
    ◎: 1,
    ◎◎: 2,
    ◎◎◎: 3,
    ◎◎◎◎: 4,
    ◎◎◎◎◎: 5,
    ◎◎◎◎◎◎: 6,
    ◎◎◎◎◎◎◎: 7,
    ◎◎◎◎◎◎◎◎: 8,

  }
end



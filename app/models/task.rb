class Task < ApplicationRecord
  belongs_to :genre
  # データベース上でnot nullとしたカラムはモデル上でもバリデーション設定しておいた
  validates :name, :text, :level, :priority, :genre_id, presence: true
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
end



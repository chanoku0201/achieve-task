class Task < ApplicationRecord
  belongs_to :genre, optional: true
  belongs_to :user, optional: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :text, presence: true, length: { maximum: 1500 }
  validates :level, presence: true
  validates :priority, presence: true
  validates :genre_id, presence: true


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
  enum genre_id: {
    NOTHING: 1,
    STUDY: 2,
    BUSINESS: 3,
    PRACTICE: 4,
    PLAY: 5,
    PROMISE: 6,
    TRAVEL: 7,
    WORK: 8,
    OTHER: 9,
  }
end



class Term < ApplicationRecord
  before_save :index_by_first_letter

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true

  scope :actives, -> { where(status: true) }
  scope :by_letter, -> (letter) { where(status: true, first_letter: letter) }


  private

  def index_by_first_letter
    self.first_letter = self.title.first.downcase
  end
end

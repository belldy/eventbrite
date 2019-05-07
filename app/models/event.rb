class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user

  #VALIDATIONS
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true}
  validates :title, presence: true,  length: { in: 5..140 }
  validates :description, presence: true,  length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true}
  validates :location, presence: true

  validate :start_date_cannot_be_in_the_past
  validate :duration_must_be_a_multiple_of_five

end

  private

  def start_date_cannot_be_in_the_past
  	if start_date.present? && start_date < Date.today
  	errors.add(:start_date, "Start date can't be in the past")
    end
  end

  def duration_must_be_a_multiple_of_five
  	if duration % 5 != 0
  	errors.add(:duration, "Duration must be a multiple of 5")
    end
  end


class Service < ApplicationRecord
  resourcify
  belongs_to :service_category
  belongs_to :employee, class_name: 'User', foreign_key: 'employee_id'
  belongs_to :client, class_name: 'User', foreign_key: 'client_id'

  delegate :name, to: :service_category, prefix: true

  enum status: %i(avaiable unavaible bought checked_in done)

  validates :scheduled_time, :status, :employee, :service_category, presence: { allow_blank: false }
  validate :scheduled_time_cannot_be_in_the_past

  private

  def scheduled_time_cannot_be_in_the_past
    if scheduled_time < Time.now
      errors.add(:scheduled_time, 'não pode estar no passado')
    end
  end
end

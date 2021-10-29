class Contact < ApplicationRecord
  include EventLoggable
  include ActionView::Helpers::DateHelper

  belongs_to :user

  validates_presence_of :email, :phone, :first_name, :last_name
  validates_length_of :first_name, maximum: 50
  validates_length_of :last_name, maximum: 50
  validates_length_of :phone, maximum: 20
  validates_length_of :email, maximum: 320
  validates :email, uniqueness: {
                      scope: :user_id,
                      message: "already exists in another contact.",
                    }, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.grouped
    all.order(first_name: :asc).group_by { |c| c.first_name[0] }
  end

  def get_logs
    event_logs.order(created_at: :desc).map do |log|
      {
        event: log.to_sentence,
        timestamp: time_ago_in_words(log.created_at),
      }
    end
  end
end

class EventLog < ApplicationRecord
  belongs_to :contact

  validates_presence_of(:action)
  validates :field, :new_value, :old_value, presence: { if: -> { action == "updated" } }

  def to_sentence
    return "Contact created." if action == "created"

    "#{field} changed to #{new_value} from #{old_value}"
  end

  def self.sentence_array
    all.map(&:to_sentence)
  end
end

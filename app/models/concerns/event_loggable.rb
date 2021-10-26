module EventLoggable
  extend ActiveSupport::Concern

  EXCLUDED_ATTRS = %w(created_at updated_at)

  included do
    has_many(:event_logs)
    after_create :log_created
    after_update :log_modified
  end

  private

  def log_created
    event_logs.create(action: "created")
  end

  def log_modified
    sanitized_changes.each do |item|
      event_logs.create(
        action: "updated",
        field: item[0].humanize,
        old_value: item[1][0],
        new_value: item[1][1],
      )
    end
  end

  def sanitized_changes
    previous_changes.entries.reject { |entry| EXCLUDED_ATTRS.include?(entry[0]) }
  end
end

require "simple_data_validator/version"

module SimpleDataValidator
  DEFAULT_REPORT_NAME = 'simple_data_validator_report.csv'.freeze

  def validate_all_data(report_name: DEFAULT_REPORT_NAME)
    CSV.open(report_name, 'wb') do |csv|
        ActiveRecord::Base.descendants.each do |model|
          begin
            invalid_records = model.select(&:invalid?)
            csv << [model, [invalid_records.count, 'invalid records found'].join(' ')]
            invalid_records.each do |record|
              begin
                csv << ['', ['id=',record.id].join, record.errors.full_messages.to_sentence]
              rescue => e
                csv << ['', ['id=',record.id].join, e.message]
                next
              end
            end
          rescue => e
            csv << [model, e.message]
            next
          end
        end
      end
    end
  end
end

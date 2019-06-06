# frozen_string_literal: true

class DateValidator < ActiveModel::EachValidator
  # define date validation method
  # -- Usage
  # in model class, set date symble true
  # model / sample.rb
  # validates :sample_date, date: true
  # --
  def validate_each(record, attribute, _)
    before_cast_value = record.send("#{attribute}_before_type_cast")

    sliced_value = before_cast_value.map { |_, value| value.to_s }.slice(0..2)
    year = sliced_value[0]
    month_day = sliced_value.slice(1, 2).map { |v| format('%02d', v) }
    parse_string = year << month_day.join

    begin
      Date.parse parse_string if parse_string.present?
    rescue ArgumentError
      record.errors.add(attribute, '不正な日付です')
    end
  end
end

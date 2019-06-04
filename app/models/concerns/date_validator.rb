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

    string_value = before_cast_value.map(&:to_s).join || ''

    begin
      Date.parse string_value if string_value.present?
    rescue ArgumentError
      # byebug
      record.errors.add(attribute, '不正な日付です')
    end
  end
end

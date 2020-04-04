# frozen_string_literal: true

module ApplicationHelper
  def class_yielder(yielded = '')
    if yielded.empty?
      'empty'
    else
      yielded
      end
  end
end

# frozen_string_literal: true

# Application
module ApplicationHelper
  def class_yielder(yielded = '')
    if yielded.empty?
      'empty'
    else
      yielded
    end
  end
end

# frozen_string_literal: true

# Useful

# rubocop: disable Metrics/MethodLength
# rubocop: disable Metrics/AbcSize
module DeviseBootstrapViewsHelper
  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map do |message|
      content_tag(:li, message)
    end
    messages.join
    sentence = I18n.t(
      'errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase
    )

    html = <<-HTML
      <div class="alert alert-info">
        <h4 class="alert-heading">#{sentence}</h4>
        <ul class="mb-0">#{messages}</ul>
      </div>
    HTML

    html.html_safe
  end
end
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/AbcSize

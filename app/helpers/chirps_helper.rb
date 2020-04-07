# frozen_string_literal: true

# Useful things inside chirps
module ChirpsHelper
  def chirp_creator(chirp)
    link_to("#{symbol_nick chirp.user} #{chirp.user.full_name}",
            user_path(chirp.user), class: 'user-title mr-auto')
  end

  def delete_chirp_btn(chirp)
    if current_user.id == chirp.user.id
      link_to(deletechirp_path(chirp, id: chirp.id),
              class: 'btn btn-sm outline-primary mt-3',
              data: { confirm: 'Are you sure?' }, method: :delete) do
        concat(content_tag(:span, 'Delete chirp').html_safe + '' +
               content_tag(:i, '', class: 'ml-2 far fa-trash-alt').html_safe)
      end
    end
  end
end

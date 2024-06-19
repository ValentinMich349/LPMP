module ApplicationHelper
    def refresh_page_once
      unless cookies[:page_refreshed]
        cookies[:page_refreshed] = { value: true, expires: 1.minute.from_now }
        tag.meta('http-equiv': 'refresh', content: '0')
      end
    end

    def cart_has_items
      current_user&.cart.present? && current_user.cart.cart_items.any?
    end
  
    def cart_count_over_one
      current_user&.cart.present? ? current_user.cart.cart_items.count : 0
    end
  end
  
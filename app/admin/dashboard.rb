ActiveAdmin.register_page "Dashboard" do
  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Users" do
          ul do
            User.order(created_at: :desc).limit(10).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Recent Orders" do
          ul do
            Order.order(created_at: :desc).limit(10).map do |order|
              li link_to("Order ##{order.id}", admin_order_path(order))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Statistics" do
          div do
            h3 "Users Count: #{User.count}"
          end
          div do
            h3 "Orders Count: #{Order.count}"
          end
          div do
            h3 "Products Count: #{Product.count}"
          end
        end
      end

      column do
        panel "Recent Products" do
          ul do
            Product.order(created_at: :desc).limit(10).map do |product|
              li link_to(product.name, admin_product_path(product))
            end
          end
        end
      end
    end
  end
end

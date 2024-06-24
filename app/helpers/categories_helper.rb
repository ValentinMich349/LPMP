module CategoriesHelper
    def categories_for_navbar
        @categories ||= Category.all
      end
end

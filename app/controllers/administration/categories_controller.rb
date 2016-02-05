module Administration
  # Controller for admin  categories
  class CategoriesController < AdministrationController
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
    end

    def new
      @category ||= Category.new
    end

    def edit
      @category ||= Category.find(params[:id])
    end

    def create
      @category = Category.new(category_params)
      if @category.valid?
        @category.save
        redirect_to administration_categories_path
      else
        redirect_to action: 'new'
      end
    end

    def update
      category = Category.find(params[:id])
      if category.update_attributes(category_params)
        redirect_to administration_categories_path
      else
        redirect_to edit_administration_category_path(category.id)
      end
    end

    def destroy
      category ||= Category.find(params[:id])
      if category.destroy
        flash[:notice] = 'The category was removed successful.'
      else
        flash[:error] = 'The category wasn´t removed successful. Please, try again in a few minutes.'
      end
      redirect_to administration_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end

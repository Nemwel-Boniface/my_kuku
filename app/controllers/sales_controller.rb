class SalesController < ApplicationController
  before_action :authenticate_user! # Assuming Devise is used

  def buy
    @chickens = Chicken.all
    @eggs = Egg.group(:poultry_type, :egg_size)
                .select('poultry_type, egg_size, AVG(price_per_egg) AS avg_price, SUM(egg_count) AS total_eggs')
  end

  def new
    # If no items are selected, redirect to the 'buy' page
    if params[:items].nil? || params[:items].empty?
      redirect_to buy_sales_path, alert: "No items selected." and return
    end

    @items = permitted_items(params[:items])
    @total_price = calculate_total_price(@items)
  end

  def create
    @sale = current_user.sales.build(total_price: params[:total_price], status: "Pending")
    
    if @sale.save
      # Create sale items for each item selected
      params[:items].each do |item_type, categories|
        categories.each do |category, details|
          @sale.sale_items.create(
            item_type: item_type.capitalize,
            category: category,
            quantity: details[:quantity],
            price_per_unit: details[:price_per_unit]
          )
        end
      end
      redirect_to @sale, notice: "Sale successfully created."
    else
      render :new
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end

  private

  def permitted_items(items)
    items.to_unsafe_h.deep_transform_keys(&:to_sym).map do |item_type, categories|
      categories.map do |category, details|
        {
          item_type: item_type,
          category: category,
          quantity: details[:quantity].to_i,
          price_per_unit: details[:price_per_unit].to_f
        }
      end
    end.flatten
  end

  def calculate_total_price(items)
    items.sum do |item|
      item[:quantity] * item[:price_per_unit]
    end
  end
end

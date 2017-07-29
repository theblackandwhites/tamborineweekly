class CartsController < ApplicationController
  def my_cart
    @carts = Cart.where(user_id: current_user.id).all
    @cart_total = @carts.sum('price')
  end

  def update_cart
  	@product = Product.find_by_id(params[:product][:product_field])
    @quantity = params[:product][:quantity]

    @my_cart = Cart.where(user_id: current_user).where(product_id: params[:product][:product_field]).last

    if @my_cart.blank?
      cart = Cart.new
      cart.user_id = current_user.id
      cart.product_id = @product.id
      cart.price = (@product.price.to_f * @quantity.to_f)
      cart.quantity = @quantity
      cart.save
    else
      @my_cart.update_attributes(:quantity => @my_cart.quantity.to_f + @quantity.to_f, :price => @my_cart.price.to_f + (@product.price.to_f * @quantity.to_f))
      @my_cart.save
    end

    @updated_qunantity = @product.updated_quantity.to_i - @quantity.to_i

    @product.update_attributes(:updated_quantity => @updated_qunantity )
    @product.save


  	respond_to do |format|
      if @product.save
        format.html { redirect_to :back, notice: @product.title + ' have been added to your cart  ' }
      end
    end
  end

  def delete_product
    @cart = Cart.find_by_id(params['c'])
    @cart.destroy
    @cart.save

    @product = Product.find_by_id(@cart.product_id)
    @product.update_attributes(:updated_quantity => @product.updated_quantity + @cart.quantity)
    @product.save

    redirect_to :back
  end

  def remove_list

    @list = List.find_by_id(params['c'])
    @list.destroy
    @list.save

    redirect_to :back
  end

  def my_list
    @lists = List.where(user_id: current_user.id).all
  end

  def trash_list_item
    @list = List.find_by_id(params[:l])
   

    @product = Product.find_by_id(@list.product_id)
    @product.update_attributes(:updated_quantity => @product.updated_quantity + @list.quantity)
    @product.save
    
    #send email to product owner, informing of cancellation and that we have added the quantity of product back.
    @user = current_user
    @product = Product.find_by_id(@list.product_id)
    @customer = User.find_by_id(@list.user_id)
    UserMailer.order_cancelation(@user, @product, @customer, @list).deliver

    @list.delete
    @list.save


    redirect_to :back
  end

  def generate_list
    @pickup = params[:qu].to_s
    @carts = Cart.where(user_id: current_user.id).all

    #Loop through cart items and send email to each owner
    @carts.each do |cart|
      #Send email to... cart.product.user_id.email
      @user = current_user
      @cart = Cart.find_by_id(cart.id)
      @product = Product.find_by_id(cart.product_id)
      @customer = User.find_by_id(cart.user_id)
      UserMailer.order_confirmation(@user, @cart, @product, @customer, @pickup).deliver

      #Create new list item in list model
      list = List.new
      list.user_id = current_user.id
      list.product_id = cart.product_id
      list.price = cart.price
      list.quantity = cart.quantity
      list.save

      #Delete cart item
      cart.destroy
    end

    redirect_to my_list_path

  end

end

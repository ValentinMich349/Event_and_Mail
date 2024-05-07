class ChargesController < ApplicationController
    def new
      
      @find = current_user.first_name
      @user = User.find_by(first_name: @find)
      @product = Event.first
      @amount = @product.price
      @stripe_amount = (@amount * 100).to_i
    end
    
    def create
      # Amount in cents
      @find = current_user.first_name
      @user = User.find_by(first_name: @find)
      @product = Event.first
      @amount = @product.price
      @stripe_amount = (@amount * 100).to_i
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: 500,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end

# frozen_string_literal: true

module Api
  module V1
    # :nodoc:
    class ProductsController < ApplicationController
      skip_before_action :authenticate_user!
      before_action :set_product, only: %i[show update destroy]

      def index
        @products = Api::FilterProductsQueryApi.new(Product.all, params).call
        render json: @products, message: 'Product list', status: :ok
      end

      def show
        render json: { status: 'SUCCESS', message: "Show product #{@product.title}", data: @product }
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: { status: 'SUCCESS', message: 'Create product', data: @product }, status: :ok
        else
          render json: { status: 'ERROR', message: @product.errors.full_messages, data: @product },
                 status: :unprocessable_entity
        end
      end

      def update
        @product.update(product_params)
        if @product.save
          render json: { status: 'SUCCESS', message: 'Products title updated', data: @product }, status: :ok
        else
          render json: { status: 'ERROR', message: @product.errors.full_messages, data: @product },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
        render json: { status: 'SUCCESS', message: 'Product destroyed', data: @product }, status: :ok
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:title, :description, :price, :category, :brand, :manufacturer, :year)
      end
    end
  end
end

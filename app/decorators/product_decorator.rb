class ProductDecorator < Draper::Decorator
  delegate_all

  def current_amount
    "На складе: #{product.amount} шт."
  end

  def price_in_rub
    "#{product.price} ₽"
  end

  def price_in_dollars
    "#{product.price} $"
  end

end

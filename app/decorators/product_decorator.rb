class ProductDecorator < Draper::Decorator
  delegate_all

  def created_at
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime("%a %m/%d/%y")
    end
  end

  def truncated_description
    h.truncate(object.description, length: 30)
  end

  def current_amount
    "На складе: #{product.amount} шт."
  end

  def price_in_rub
    "#{product.price} ₽"
  end

  def price_in_dollars
    "$#{product.price}"
  end

end

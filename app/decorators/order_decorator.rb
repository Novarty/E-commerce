class OrderDecorator < Draper::Decorator
  delegate_all

  def order_id
      "Order №#{object.id}"
  end
  def created_at
      object.created_at.strftime("%A %d/%m/%y ")
  end

  def created_at_time
    object.created_at.strftime("%k:%M ")
  end

  def updated_at
      object.updated_at.strftime("%A %d/%m/%y ")
  end

end

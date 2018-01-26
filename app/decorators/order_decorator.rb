class OrderDecorator < Draper::Decorator
  delegate_all

  def order_id
      "Order №#{object.id}"
  end
  def created_at
    if I18n.locale = "ru"
      object.created_at.strftime("%a %d.%m.%y ")
    else
      object.created_at.strftime("%a %y.%m.%d ")
    end
  end

  def created_at_time
    object.created_at.strftime("%k:%M ")
  end

  def updated_at
      object.updated_at.strftime("%A %d/%m/%y ")
  end

end

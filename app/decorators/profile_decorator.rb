class ProfileDecorator < Draper::Decorator
  delegate_all

  def created_at
    if I18n.locale = "ru"
      object.created_at.strftime("%a %d.%m.%y ")
    else
      object.created_at.strftime("%a %y.%m.%d ")
    end
  end
end

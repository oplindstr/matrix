module MessageHelper
  def created_message(object_type)
    return "#{I18n.t(object_type)} #{I18n.t('created')}"
  end

  def updated_message(object_type)
    return "#{I18n.t(object_type)}#{I18n.t('updated')}"
  end

  def destroyed_message(object_type)
    return "#{I18n.t(object_type)} #{I18n.t('destroyed')}"
  end
end

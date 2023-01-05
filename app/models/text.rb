class Text < ActiveRecord::Base
    def get_value
        if I18n.locale == :en and self.value_eng
            return self.value_eng
        end
        return self.value
    end
end

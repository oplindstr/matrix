class Text < ActiveRecord::Base
    def get_value
        if I18n.locale == :en and self.value_eng and self.value_eng.length > 0
            return self.value_eng
        end
        return self.value
    end
end

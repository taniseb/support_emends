class Support < ApplicationRecord
  #belongs_to :user - default. Mudança para ficar mais claros os nomes.
  belongs_to :supporter, class_name: 'User', foreign_key: 'user_id'
  belongs_to :emmend
end

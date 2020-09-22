class Emmend < ApplicationRecord
  belongs_to :user
  has_many :supports
  #has_many :user, through: :supports, default. Mudança para ficar mais claros os nomes.
  has_many :supporters, through: :supports, source: :supporter
end

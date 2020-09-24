class Emmend < ApplicationRecord
  validates :name, presence:true, :length => { :minimum => 5}
  validates :project, presence:true
  validates :thema, presence:true
  validates :description, presence:true, :length => { :minimum => 15}
  belongs_to :user
  has_many :supports, dependent: :destroy
  #has_many :user, through: :supports, default. Mudança para ficar mais claros os nomes.
  has_many :supporters, through: :supports, source: :supporter

end

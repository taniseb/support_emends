class Emmend < ApplicationRecord
  validates :name, presence:true, :length => { :minimum => 5}
  validates :project, presence:true
  validates :thema, presence:true
  belongs_to :user
  has_many :supports, dependent: :destroy
  #has_many :user, through: :supports, default. Mudança para ficar mais claros os nomes.
  has_many :supporters, through: :supports, source: :supporter
  include PgSearch::Model
    pg_search_scope :search_by_name_and_description_and_project_and_thema,
      against: [ :name, :description, :project, :thema ],
      using: {
        tsearch: { prefix: true }
    }
end

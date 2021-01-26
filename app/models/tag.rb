class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  validates :name, presence: true, uniqueness: true
  
  has_and_belongs_to_many :quote
end

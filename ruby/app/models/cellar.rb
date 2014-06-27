class Cellar < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true

  validates_uniqueness_of :name

  belongs_to :user
  has_many :wines

  def self.init(name)
    cellar = Cellar.new
    if Cellar.find_by_name(name)
      name = name + Math.rand(500)
    end

    cellar.set_name(name)
    cellar.save!
    cellar
  end

  def self.set_name(name)
    self.name = name
  end

  def self.get_name
    self.name
  end
end
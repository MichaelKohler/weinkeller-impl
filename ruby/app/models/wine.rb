class Wine < ActiveRecord::Base
  validates :name, :amount, presence: true

  validates_uniqueness_of :name

  belongs_to :cellar

  def self.check_if_name_exists(name)
    weinkeller = find_by_name(name)
    weinkeller
  end

  def self.create_new(name)
    @weinkeller = Cellar.new

    if check_if_name_exists(name)
      name = name + Math.rand(500).to_s
    end

    @weinkeller.set_name(name)
    @weinkeller
  end

  def set_name(name)
    self.name = name
  end

  def get_name
    self.name
  end

  def set_amount(amount)
    self.amount = amount
  end

  def get_amount
    self.amount
  end
end
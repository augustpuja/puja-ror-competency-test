class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, optional: true
  has_many :articles, dependent: :destroy
  validates :name, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'User' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def editor?
    role.name == 'Editor'
  end

  def vanila_user?
    role.name == 'User'
  end
end

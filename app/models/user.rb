class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nombre_user, presence: true
  validates :nivel_estudio, presence: true
  validates :apellido_ma, presence: true
  validates :apellido_pa, presence: true
  validates :rut, presence: true
  validates :fecha_nacimiento, presence: true
  validates :comuna, presence: true
  validates :direccion, presence: true
  validates :fecha_ingreso, presence: true
  validates :especialidad, presence: true
  validates :telefono, presence: true
  validates :estado, presence: true


      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

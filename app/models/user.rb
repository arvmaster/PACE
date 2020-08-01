class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :archivos
  has_many :datos_carreras
  belongs_to :estudio
  belongs_to :recinto
  has_many :informes
  has_many :pregunta_informes, through: :informes
  has_many :cuestionarios
  has_many :pregunta_cuestionarios, through: :cuestionarios
  #
  validates :nombre_user, presence: true
  validates :nivel_estudio, presence: true
  validates :apellido_ma, presence: true
  validates :apellido_pa, presence: true
  validates :rut, presence: true
  #validates :fecha_nacimiento, presence: true
  #validates :comuna, presence: true
  #validates :direccion, presence: true
  #validates :fecha_ingreso, presence: true
  #validates :especialidad, presence: true
  #validates :telefono, presence: true
  #validates :estado, presence: true


      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

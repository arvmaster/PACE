class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :archivos
  has_many :datos_carreras
  belongs_to :estudio, optional: true
  belongs_to :recinto, optional: true
  has_many :informes
  has_many :pregunta_informes, through: :informes
  has_many :cuestionarios
  has_many :pregunta_cuestionarios, through: :cuestionarios
  #
  include RunCl::ActAsRun
  validates  :rut,presence: { message: 'Ingrese un rut'}, uniqueness: true
  has_run_cl :rut

  VALID_EMAIL_REGEX = /[a-z0-9]+[_a-z0-9.-][a-z0-9]+@[a-z0-9-]+(.[a-z0-9-]+)(.[a-z]{2,4})/
  validates :email, format: { with: VALID_EMAIL_REGEX , message: "es invalido" }, confirmation: { case_sensitive: false }, uniqueness: { message: "Ya existe" }, length: { in: 7..254 , :message => " El correo debe estar los 7 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }
  VALID_NAME_REGEX = /(?=^.{2,40}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/  #quitar numeros
  validates :nombre_user, presence: { message: 'Ingrese el primer nombre '}, length: {in: 3..40, message:'El nombre debe ser de mínimo largo 3'}, format: {with: VALID_NAME_REGEX, message: "Se permiten solo letras en los nombres"}
  validates :apellido_pa, presence: { message: 'Ingrese el primer apellido'}, length: {in: 3..20, message:'El apellido debe ser de mínimo largo 3'}, format: {with: VALID_NAME_REGEX,message: "Se permiten solo letras en los apellidos"}
  validates :apellido_ma, presence: { message: 'Ingrese el segundo apellido'}, length: {in: 3..20, message:'El apellido debe ser de mínimo largo 3'}, format: {with: VALID_NAME_REGEX, message: "Se permiten solo letras en los apellidos"}
  validates :nivel_estudio, presence: true
  validates :estado, :inclusion => {:in=> [true,false]}
  validates :fecha_nacimiento, presence: true
  validates :comuna, presence: true
  validates :direccion, length: { in: 10..254 , :message => " La direccion debe estar los 10 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }
  #validates :fecha_ingreso, presence: true
  #validates :especialidad, presence: true
  #VALID_NUMBER_REGEX = /^(\+?56)?(\s?)(0?9)(\s?)[98765]\d{7}$/
  #validates :telefono, presence: {message: 'Ingrese Telefono'}, length: {is: 9, message:'Largo debe ser 9'}
  #validates :estado, presence: true
  #validate :fecha_de_nacimiento_debe_ser_en_pasado
  #validate :edadminima



  def fecha_de_nacimiento_debe_ser_en_pasado
    if fecha_nacimiento.present? && fecha_nacimiento >= Date.today
      errors.add(:fecha_nacimiento, "debe ser anterior a la fecha de hoy")
    end
  end


  def edadminima
    if fecha_nacimiento.present? && fecha_nacimiento >= 18.year.ago
      errors.add(:fecha_nacimiento, "debe ser mayor de 18 años")
    end
  end

      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

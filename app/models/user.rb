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
  has_many :user_eventos
  has_many :eventos, through: :user_eventos

  include RunCl::ActAsRun
  validates  :dni, presence: { message: 'Ingrese un rut'}, uniqueness: true
  has_run_cl :dni

  VALID_EMAIL_REGEX = /[a-z0-9]+[_a-z0-9.-][a-z0-9]+@[a-z0-9-]+(.[a-z0-9-]+)(.[a-z]{2,4})/
  validates :email, format: { with: VALID_EMAIL_REGEX , message: "es invalido" },
                    confirmation: { case_sensitive: false },
                    uniqueness: { message: "Ya existe" },
                    length: { in: 7..254 , :message => " El correo debe estar los 7 a 254 caracteres"},
                    presence: { message: "no puede estar en blanco" }
  VALID_NAME_REGEX = /(?=^.{2,40}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/  #quitar numeros
  #validates :name, presence: { message: 'Ingrese el primer nombre '}, length: {in: 2..40, message:'El nombre debe ser de mínimo largo 3'}, format: {with: VALID_NAME_REGEX, message: "Se permiten solo letras en los nombres"}
  #validates :first_last_name, presence: { message: 'Ingrese el primer apellido'}, length: {in: 2..20, message:'El apellido debe ser de mínimo largo 3'}, format: {with: VALID_NAME_REGEX,message: "Se permiten solo letras en los apellidos"}
  #validates :second_last_name, presence: { message: 'Ingrese el segundo apellido'}, length: {in: 2..20, message:'El apellido debe ser de mínimo largo 3'}, format: {with: VALID_NAME_REGEX, message: "Se permiten solo letras en los apellidos"}
  #validates :academic_level, presence: true
  #validates :active, :inclusion => {:in=> [true,false]}
  #validates :born_date, presence: true
  #validates :address, length: { in: 10..254 , :message => " La direccion debe estar los 10 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }
  #validates :registration_date, presence: true
  #validates :specialization_branch, presence: true
  #VALID_NUMBER_REGEX = /^(\+?56)?(\s?)(0?9)(\s?)[98765]\d{7}$/
  #validate :fecha_de_nacimiento_debe_ser_en_pasado
  #validate :edadminima

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create! row.to_hash
    end
  end

  def fecha_de_nacimiento_debe_ser_en_pasado
    if born_date.present? && born_date >= Date.today
      errors.add(:born_date, "debe ser anterior a la fecha de hoy")
    end
  end


  def edadminima
    if born_date.present? && born_date >= 15.year.ago
      errors.add(:born_date, "debe ser mayor de 15 años")
    end
  end

  def self.nationalities
    ["afgano/afgana","alemán/alemana","árabe/árabe","argentino/argentina","australiano/australiana","belga/belga","boliviano/boliviana","brasileño/brasileña","camboyano/camboyana","canadiense/canadiense","chileno/chilena","chino/china","colombiano/colombiana","coreano/coreana","costarricense/costarricense","cubano/cubana","danés/danesa","ecuatoriano/ecuatoriana","egipcio/egipcia","salvadoreño/salvadoreña","escocés/escocesa","español/española","estadounidense/estadounidense","estonio/estonia","etiope/etiope","filipino/filipina","finlandés/finlandesa","francés/francesa","galés/galesa","griego/griega","guatemalteco/guatemalteca","haitiano/haitiana","holandés/holandesa","hondureño/hondureña","indonés/indonesa","inglés/inglesa","iraquí/iraquí","iraní/iraní","irlandés/irlandesa","israelí/israelí","italiano/italiana","japonés/japonesa","jordano/jordana","laosiano/laosiana","letón/letona","letonés/letonesa","malayo/malaya","marroquí/marroquí","mexicano/mexicana","nicaragüense/nicaragüense","noruego/noruega","neozelandés/neozelandesa","panameño/panameña","paraguayo/paraguaya","peruano/peruana","polaco/polaca","portugués/portuguesa","puertorriqueño/puertorriqueño","dominicano/dominicana","rumano/rumana","ruso/rusa","sueco/sueca","suizo/suiza","tailandés/tailandesa","taiwanes/taiwanesa","turco/turca","ucraniano/ucraniana","uruguayo/uruguaya","venezolano/venezolana","vietnamita/vietnamita" ]
  end

  def self.communes
    ["Cerrillos", "Cerro Navia", "Conchalí", "El Bosque", "Estación Central", "Huechuraba", "Independencia", "La Cisterna", "La Florida", "La Granja", "La Pintana", "La Reina", "Las Condes", "Lo Barnechea", "Lo Espejo", "Lo Prado", "Macul", "Maipú", "Ñuñoa", "Pedro Aguirre Cerda", "Peñalolén", "Providencia", "Pudahuel","Santiago Centro", "Quilicura", "Quinta Normal", "Recoleta", "Renca", "San Joaquín", "San Miguel", "San Ramón", "Vitacura", "Puente Alto", "Pirque", "San José de Maipo", "Colina", "Lampa", "Tiltil", "San Bernardo", "Buin", "Calera de Tango", "Paine", "Melipilla", "Alhué", "Curacaví", "María Pinto", "San Pedro", "Talagante", "El Monte", "Isla de Maipo", "Padre Hurtado", "Peñaflor"]
  end

  def self.roles
    #["Admin","PEM", "AES", "Tutor Disciplinar", "Tutor Par", "Coordinación", "Profesional Acompañamiento Psicoeducativo", "Estudiante"]
    ["PEM", "AES", "Tutor Disciplinar", "Tutor Par", "Coordinación", "Profesional Acompañamiento Psicoeducativo", "Estudiante"]
  end

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
end

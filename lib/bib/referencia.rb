
class Referencia
  attr_reader :autor, :titulo,  :fecha_publicacion
  include Comparable
  
  def initialize(autor, titulo, publicacion)
    @autor = Array.new(autor) 
    @titulo =  titulo
    @fecha_publicacion = publicacion
  end
end
class Libro < Referencia
  attr_accessor :editorial, :serie, :numero_edicion, :numero_ISBN
  def initialize(autor, titulo, editorial, serie, edicion, publicacion, isbn)
    super(autor,titulo,publicacion)
    @editorial = editorial
    @serie = serie
    @numero_edicion = edicion
    @numero_ISBN = Array.new(isbn)
  end
  def to_s
    "#{@autor},
      #{@numero_ISBN},
      #{@titulo},
      #{@editorial},
      #{@serie},
      #{@numero_edicion},
      #{@fecha_publicacion}"
  end
  
  def mensaje
    "Probando herencia desde Libro"
  end
end

class Revista < Referencia
  attr_accessor :numero_ISSN
  
  def initialize(autor, titulo, publicacion, issn)
      super(autor,titulo,publicacion)
      @numero_ISSN = Array.new(issn)
  end
  
  def to_s
    "#{@autor},
      #{@titulo},
      #{@fecha_publicacion},
      #{@numero_ISSN}"
  end
  def mensaje
    "Probando herencia desde Revista"
  end
end

class Documento_electronico < Referencia
  attr_accessor :url
  def initialize(autor, titulo, publicacion, url)
      super(autor,titulo,publicacion)
      @url = url
  end

  def to_s
    "#{@autor},
      #{@titulo},
      #{@fecha_publicacion},
      #{@url}"
  end
  def mensaje
    "Probando herencia desde Documento_electronico"
  end
end
 

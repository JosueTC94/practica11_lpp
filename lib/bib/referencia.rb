
class Apa
  # require "../bib/nodo"
  # require "../bib/lista"
  
  attr_reader :lista1
  
 
  def initialize()
      @lista1 = Lista.new()
  end  

  def to_s
    @lista1.sort
    aux = @lista1.inicio

    while(aux != nil)
       mostrar_autor(aux.value.autor)
       if(aux.value.is_a? Libro) then
          sangria(mostrar_titulo(aux.value.titulo))
       else
          sangria(aux.value.titulo)
      end
       sangria(aux.value.fecha_publicacion)
       aux = aux.next
    end
  end
end

def mostrar_autor(string)
    cadena = ""
    proc = proc_from { |array| array.each_with_index do |word, i|
             if(i+1 == array.size) then
                cadena +=  array[i].split(" ")[1] << " " << array[i].split(" ")[0] << " "
             else
                cadena +=  array[i].split(" ")[1] << " " << array[i].split(" ")[0] << " & " 
             end
             i += 1
          end
      }
    proc.call(string)
    puts cadena
end

def mostrar_titulo(string)
    cad = ""
    proc = proc_from { |cadena| cadena.split(" ").each do |i| cad += i.capitalize << " "
              end
    }
    proc.call(string)
    return cad
end

def sangria(string)
    puts "\t" << string
end

class Referencia
  attr_reader :autor, :titulo,  :fecha_publicacion
  include Comparable
  
  def initialize(autor, titulo, publicacion)
    @autor = Array.new(autor) 
    @titulo =  titulo
    @fecha_publicacion = publicacion
  end
  def <=>(other)
    if((@autor <=> other.autor)==0) 
        if ((@fecha_publicacion <=> other.fecha_publicacion)==0)
          @titulo <=> other.titulo
        else
          @fecha_publicacion <=> other.fecha_publicacion
        end
    else
        @autor <=> other.autor
    end
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

class Article
  attr_accessor :identificador_articulo, :author, :journal, :title, :abstract, :date
  
  def initialize(id_articulo, &block)
    self.identificador_articulo = id_articulo
    self.author = []
    self.journal = ''
    self.title = ''
    self.abstract = ''
    self.date = ''

    if block_given?  
      if block.arity == 1
        yield self
      else
       instance_eval &block 
      end
    end    
  end
  
  def nombre_autor(options = {})
    nombres_autores = ''
    nombres_autores << "#{options[:surname]}" if options[:surname] << " #{options[:name]}" if options[:name]
    author << nombres_autores
  end
  
  def journal_(options = {})
    jour = ''
    jour << "#{options[:name]}" if options[:name] << " , volume #{options[:volume]}" if options[:volume] << ", issue #{options[:issue]}" if options[:issue]
    journal << jour
  end
  
  def title_(options = {})
    titulo_articulo = ''
    titulo_articulo << " #{options[:name]}" if options[:name]
    title << titulo_articulo
  end
  
  def date_(options = {})
    fecha_publicacion = ''
    fecha_publicacion << "#{options[:dia]}" if options[:dia] << "/#{options[:mes]}" if options[:mes] << "/#{options[:year]}" if options[:year]
    date << fecha_publicacion
  end
  
  def abstract_(options = {})
    resumen = ''
    resumen << " #{options[:resumen]}" if options[:resumen]
    abstract << resumen
  end

  def to_s
    output = identificador_articulo
    output << "\n#{'=' * identificador_articulo.size}\n"
    output << "Author: #{author.join(' & ')}\n"
    output << "Journal: #{journal}\n"
    output << "Title: #{title}\n"
    output << "Date: #{date}\n"    
    output << "Abstract: #{abstract}\n"
    output
  end  
end

def proc_from
    Proc.new
end





class Apa
   require "../bib/nodo"
   require "../bib/lista"
  
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
 
def gen_times(factor)
    return Proc.new {|n| n*factor }
end

def proc_from
    Proc.new
end

times3 = gen_times(3)
times5 = gen_times(5)

#proc = proc_from {|word| word = word.split(" ")[1],word.split(" ")[0]}

#proc = proc_from { |array| array.split(",").each{|i| i.capitalize!}.join(' ')}

#ESTE SIRVE
 proc = proc_from { |array| array.each_with_index do |word, i|
                         array[i] = array[i].split(" ")[1]+" "+array[i].split(" ")[0]
 #                      puts i  
                     end
 }

#ESTE SIRVE
# proc = proc_from { |cadena| cadena = cadena.split(" ").each{|i| i.capitalize!}}
 
# #array.split(",").each{|i| i.capitalize!}.join(' ')}
# ar = ["david thomas","pepe mujica"]

# libro = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2013)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])
# revista1 = Revista.new(["Juan Jimenez","Alvaro Font","Almudena Fernandez"],"national geography", "14 de Diciembre", ["ISSN:JDCYCFHNF75","ISSN:KKSDKDKK"])


# puts proc.call(revista1.titulo)
# puts "\n"
# puts ar.size

libro1 = Libro.new(["Dave Thomas"], "programming ruby 1.9 & 2.0: the pragmatic programmers guide. (the facets of ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2015)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])
libro2 = Libro.new(["Dave Thomas","Jose Fons"], "programming ruby 1.9 & 2.0: the pragmatic programmers guide. (the facets of ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2015)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])

nodo1 = Node.new(libro1)
nodo2 = Node.new(libro2)

apa1 = Apa.new()
apa1.lista1.insertar_nodo(nodo1)
apa1.lista1.insertar_nodo(nodo2)

apa1.to_s



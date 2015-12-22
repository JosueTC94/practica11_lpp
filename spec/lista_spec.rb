# encoding UTF-8
require 'spec_helper'
require 'bib'

describe Lista do
    before :each do
        
        #Objeto de clase Libro
        @libro1 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2013)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])
        @libro2 = Libro.new(["Dav Thomas", "Andy Hunt", "Chad Fowler"], "Programm Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 5, "(July 7, 2015)", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
        @libro3 = Libro.new(["Thomas", "Hunt", "Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 3, "(July 7, 2013)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])
        @libro4 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2013)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])

        #Objeto de clase Revista
        @revista1 = Revista.new(["Juan Jimenez","Alvaro Font","Almudena Fernandez"],"National Geography", "14 de Diciembre", ["ISSN:JDCYCFHNF75","ISSN:KKSDKDKK"])
        @revista2 = Revista.new(["Juan Jimenez","Alvaro Font","Almudena Fernandez"],"National Geography 1.0", "14 de Diciembre", ["ISSN:JDCYCFHNF76","ISSN:KKSDKDKK"])
        @revista3 = Revista.new(["Pepe","Alvaro Font","Almudena Fernandez"],"National Geography 1.0", "13", ["ISSN:JDCYCFHNF77","ISSN:KKSDKDKK"])
        
        #Objeto de clase Documento_electronico
        @documento_electronico1 = Documento_electronico.new(["Magdalena,Susana,Florentina"], "Aprende a programar Ruby","18 de julio", "https://magdalenatj.github.io/tutorial_ruby")
        @documento_electronico2 = Documento_electronico.new(["Sofia,Fernanda,Maria"], "Aprende a programar Python","18 de julio", "https://magdalenatj.github.io/tutorial_ruby")     
        @documento_electronico3 = Documento_electronico.new(["Barbara,Antonia,Marta"], "Aprende a programar Ruby","18 de julio", "https://magdalenatj.github.io/tutorial_ruby")
        
        #Objeto de clase Lista
        @lista1=Lista.new()
        @lista2=Lista.new()
        
        #Objetos de clase Nodo
        @nodo_1 = Node.new(@revista1,nil,nil)
        @nodo_2 = Node.new(@documento_electronico1,nil,nil)
        @nodo_3 = Node.new(@libro1,nil,nil)
        @nodo_4 = Node.new(@libro1,nil,nil)
    end
    describe "Probando funcionamiento de Lista" do
        it "Existe una lista" do
            expect(@lista1.is_a? Lista).to be true        
        end
        
        it "Compruebo la existencia de un nodo anterior en la lista" do
            #Inserto dos nodos en la lista
            @lista1.insertar_nodo(@nodo_1)
            @lista1.insertar_nodo(@nodo_2)
            
            #Extraigo el último y compruebo si tiene anterior
            expect(@lista1.extraer_final().prev).not_to be nil
        end
        
        it "Compruebo la existencia de un nodo siguiente en la lista" do
            #Inserto dos nodos en la lista
            @lista1.insertar_nodo(@nodo_1)
            @lista1.insertar_nodo(@nodo_2)
            
            #Extraigo el primero y compruebo si tiene siguiente
            expect(@lista1.extraer_inicio().next).not_to be nil
        end
        
        it "No existe nodo previo a inicio" do
            @lista1.insertar_nodo(@nodo_1)
            #Compruebo que la lista no está vacía, que se ha insertado el nodo correctamente
            expect(@lista1.lista_vacia()).to be false
            expect(@lista1.inicio).not_to be nil
            expect(@lista1.final).not_to be nil
            
            #Compruebo que no existe nodo previo a inicio
            expect(@lista1.inicio.prev).to be nil
        end
        
        it "No existe un nodo siguiente a final" do
            @lista1.insertar_nodo(@nodo_1)
            #Compruebo que la lista no está vacía, que se ha insertado el nodo correctamente
            expect(@lista1.lista_vacia()).to be false
            expect(@lista1.inicio).not_to be nil
            expect(@lista1.final).not_to be nil
            
            #Compruebo que no existe nodo siguiente a final
            expect(@lista1.final.next).to be nil
        end
        
        it "Se insertan una revista, un libro y un documento electronico en una lista" do
            @lista1.insertar_nodo(@nodo_1)
            @lista1.insertar_nodo(@nodo_2)
            @lista1.insertar_nodo(@nodo_3)
            
            #Compruebo que la lista no esté vacía
            expect(@lista1.lista_vacia()).not_to be true
            #Compruebo que los elementos insertados se corresponden con el valor correcto
            expect(@lista1.extraer_final().value.to_s) == ("[Dave Thomas, Andy Hunt, Chad Fowler], Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide. (The Facets of Ruby), Pragmatic Bookshelf, , 4, (July 7, 2013), [ISBN-13: 978-1937785499, ISBN-10: 1937785491]")
            expect(@lista1.extraer_final().value.to_s) ==("[Magdalena], Aprende a programar Ruby, 27 de Septiembre de 2003, https://magdalenatj.github.io/tutorial_ruby")
            expect(@lista1.extraer_final().value.to_s) == ("[Juan Jimenez,Alvaro Font,Almudena Fernandez],National Geography, 14 de Enero de 2000, [ISSN:JDCYCFHNF75,ISSN:KKSDKDKK]")
        end
    end
    describe "Probando funcionamiento de herencia" do
          
        it "Existe una clase Lista que es hija de Object" do
            expect(@lista1.class.superclass.to_s == Object)
            expect(@lista.is_a? Object).to be true
        end
        
        it "Existe un objeto revista1 de la clase Revista hija de Referencia" do
            expect(@revista1.instance_of? Revista).to be true
            expect(@revista1.is_a? Referencia).to be true
            expect(@revista1.class.superclass.to_s ==  Referencia)
            expect(@revista1.mensaje) == "Probando herencia desde Revista" 
        end
        
        it "Existe un documento_electronico1 de la clase Documento_electronico hija de Referencia" do
            expect(@documento_electronico1.instance_of? Documento_electronico).to eq true
            expect(@documento_electronico1.is_a? Referencia).to eq true
            expect(@documento_electronico1.class.superclass.to_s == Referencia)
            expect(@documento_electronico1.mensaje == "Probando la herencia desde Documento_electronico")
        end
        
        it "Existe un objeto libro1 de la clase Libro hija de Referencia" do
            expect(@libro1.is_a? Libro).to be true
            expect(@libro1.is_a? Referencia).to be true
            expect(@libro1.class.superclass.to_s ==  Referencia)
            expect(@libro1.mensaje) == "Probando herencia desde Libro"
        end
        
        it "Existe un objeto libro1 que no tiene como atributo ISSN(atributo de Clase Revista)" do
            @lista1.insertar_nodo(@nodo_3)
            expect(@lista1.extraer_final().value.respond_to?('numero_ISSN')).to be false
        end
            
        it "Existe un objeto revista1 que no tiene como atributo ISBN(atributo de Clase Libro)" do
            @lista1.insertar_nodo(@nodo_1)
            expect(@lista1.extraer_final().value.respond_to?('numero_ISBN')).to be false
        end
            
        it "Existe un objeto documento_electronico1 que no tiene como atributo edicion(atributo de Clase Libro)" do
            @lista1.insertar_nodo(@nodo_2)
            expect(@lista1.extraer_final().value.respond_to?('numero_edicion')).to be false
        end
        
        it "Existe un objeto libro1 cuyo metodo mensaje no devuelva: 'Clase Referencia'" do
            @lista1.insertar_nodo(@nodo_3)
            expect(@lista1.extraer_final().value.mensaje) != ("Clase Referencia")
        end
        
        it "Existe un objeto revista1 cuyo metodo mensaje no devuelva: 'Clase Referencia'" do
            @lista1.insertar_nodo(@nodo_1)
            expect(@lista1.extraer_final().value.mensaje) != ("Clase Referencia")
        end
        
        it "Existe un objeto documento_electronico1 cuyo metodo mensaje no devuelva: 'Clase Referencia'" do
            @lista1.insertar_nodo(@nodo_2)
            expect(@lista1.extraer_final().value.mensaje) != ("Clase Referencia")
        end
        
        it "Existe un objeto libro1 cuyo metodo mensaje no devuelva: 'Probando herencia desde Revista'" do
            @lista1.insertar_nodo(@nodo_3)
            expect(@lista1.extraer_final().value.mensaje) != ("Probando herencia desde Revista")
        end
            
        it "Existe un objeto revista1 cuyo metodo mensaje no devuelva: 'Probando herencia desde Libro'" do
            @lista1.insertar_nodo(@nodo_1)
            expect(@lista1.extraer_final().value.mensaje) == ("Probando herencia desde Revista")
        end
            
        it "Existe un objeto documento_electronico1 cuyo metodo mensaje no devuelva: 'Probando herencia desde Revista o Libro'" do
            @lista1.insertar_nodo(@nodo_2)
            expect(@lista1.extraer_final().value.mensaje) == ("Probando herencia desde Documento_electronico")

        end 
    end
    
    describe "Comparando referencias bibliográficas" do
        it "Comparo dos libros directamente" do
            expect(@libro1 <=> @libro4).to eq(0)
        end
        it "Los autores de dos libros son diferentes" do
            expect(@libro3.autor != @libro1.autor).to eq(true)
        end
        it "El título del libro1 no es menor que el título del libro 2" do
            expect(@libro1.titulo <= @libro2.titulo).to eq(false)
        end
        it "Las fechas de publicacion de dos libros diferentes" do
            expect(@libro1.fecha_publicacion == @libro2.fecha_publicacion).to eq(false)
        end
        it "Los números isbn de dos libros son diferentes" do
           expect(@libro1.numero_ISBN != @libro2.numero_ISBN).to eq(true) 
        end
        it "Los números de edición de 2 libros son diferentes" do
            expect(@libro1.numero_edicion < @libro2.numero_edicion).to eq(true)
        end
        it "Los números de edición de 2 libros son distintos" do
            expect(@libro1.numero_edicion != @libro2.numero_edicion).to eq(true) 
        end
        it "Los titulos de 2 revistas son diferentes" do
            expect(@revista1.titulo <=> @revista2.titulo).to eq(-1)
        end
        it "La fecha de publicacion de 2 revistas son iguales" do
            expect(@revista1.fecha_publicacion <=> @revista2.fecha_publicacion).to eq(0)
        end
        it "Los titulos de 2 revistas son iguales" do
            expect(@revista1.autor <=> @revista2.autor).to eq(0)
        end
        it "Los números ISSN de dos revistas son diferentes" do
            expect(@revista1.numero_ISSN != @revista2.numero_ISSN).to eq(true) 
        end
        it "Los números ISSN de dos revistas son diferentes" do
            expect(@revista1.numero_ISSN != @revista3.numero_ISSN).to eq(true) 
        end
        it "Fecha de publicación de la revista1 es menor o igual que la fecha de publicación de la revista 2" do
            expect(@revista1.fecha_publicacion >= @revista2.fecha_publicacion).to eq(true)
        end
        it "Los titulos de dos documentos electrónicos son diferentes" do
            expect(@documento_electronico1.titulo != @documento_electronico2.titulo).to eq(true)
        end
        it "Las url de dos documentos electrónicos son iguales" do
            expect(@documento_electronico1.url <=> @documento_electronico2.url).to eq(0)
        end
    end
    describe "Modulo enumerable->usando referencias" do
        before :each do
           @lista1.insertar_nodo(@libro1)
           @lista1.insertar_nodo(@libro2)
           @lista1.insertar_nodo(@libro3)
           @lista1.insertar_nodo(@revista1)
           @lista1.insertar_nodo(@revista2)
           @lista1.insertar_nodo(@revista3)
           @lista1.insertar_nodo(@documento_electronico1)
           @lista1.insertar_nodo(@documento_electronico2)
           @lista1.insertar_nodo(@documento_electronico3)
        end
        it "Contamos los nodos de la lista" do
            expect(@lista1.count).to eq(9)
        end
        it "Buscamos el máximo de la lista" do
            expect(@lista1.max).to eq(@libro3) 
        end
        it "Buscamos el mínimo de la lista" do
            expect(@lista1.min).to eq(@documento_electronico3)
        end
        it "Todos los nodos son Referencias" do
            expect(@lista1.all? {|nodo| nodo.is_a? Referencia}).to be true 
        end
        it "Al menos uno de los elementos es un Libro" do
             expect(@lista1.any? {|nodo| nodo.is_a? Libro }).to be true
        end
        it "Lista1 tiene un libro como miembro" do
            expect(@lista1.member? (@libro3)).to be true
        end
        it "Utilizando Drop" do
           expect(@lista1.drop(3)).to eq([@revista1,@revista2,@revista3,@documento_electronico1,@documento_electronico2,@documento_electronico3]) 
        end
        it "Utilizando Reject" do
            expect(@lista1.reject {|nodo| nodo.is_a? Documento_electronico or nodo.is_a? Revista}).to eq([@libro1,@libro2,@libro3])
        end
    end
    describe "Modulo enumerable->usando enteros y caracteres" do
        before :each do
            @lista1.insertar_nodo(1)
            @lista1.insertar_nodo(2)
            @lista1.insertar_nodo(3)
            @lista1.insertar_nodo(4)
            @lista1.insertar_nodo(5)
            @lista1.insertar_nodo(6)
            @lista1.insertar_nodo(7)
            
            @lista2.insertar_nodo("a")
            @lista2.insertar_nodo("bbb")
            @lista2.insertar_nodo("cccccc")
        end
        it "Prueba con count con enteros" do
            expect(@lista1.count).to eq(7)
        end
        it "Prueba con max con enteros" do
            expect(@lista1.max).to eq(7) 
        end
        it "Prueba con min con enteros" do
            expect(@lista1.min).to eq(1)
        end
        it "Todos los elementos son mayores que 0" do
            expect(@lista1.all? { |numero| numero >=1}).to be true 
        end
        it "Al menos uno de los elementos de la lista es mayor que 6" do
            expect(@lista1.any? {|numero| numero > 6 }).not_to be false
        end
        it "Prueba con any?" do
            expect(@lista2.any? {|word| word.length >= 3}).to be true
        end
        it "Prueba con all?" do
            expect(@lista2.all? {|word| word.length >= 1}).to be true
        end
        it "Prueba con collec" do
            expect(@lista1.map { |i| i*2 }).to eq([2,4,6,8,10,12,14])
        end
        it "Prueba con collec" do
            expect(@lista1.flat_map { |i| [i,-i]}).to eq([1,-1,2,-2,3,-3,4,-4,5,-5,6,-6,7,-7])
        end
        it "Cuento los elementos de la lista que son divisibles por 2" do
            expect(@lista1.count {|x| x%2==0}).to eq(3)
        end
        it "Muestro los elementos de la lista desde la posicion 5" do
            expect(@lista1.drop(5)).to eq([6,7])
        end
        it "Encuentro elemento que sea divisible por 7" do
            @lista1.insertar_nodo(8)
            @lista1.insertar_nodo(9)
            @lista1.insertar_nodo(10)
            @lista1.insertar_nodo(11)
            @lista1.insertar_nodo(12)
            @lista1.insertar_nodo(13)
            @lista1.insertar_nodo(14)
            
            expect(@lista1.find {|x| x%7==0}).not_to be nil
            expect(@lista1.find {|x| x%7==0}).to eq(7)
            
            #Extraigo nodos de la lista hasta que nodo.value != 8
            aux = @lista1.inicio
            while(aux.value!=8) do
                @lista1.extraer_inicio()
                aux = aux.next
            end
            expect(@lista1.find {|x| x%7==0}).to eq(14)            
        end
    end
    
    describe "Practica 10 Citas" do
        before :each do
            @apa1 = Apa.new()
            @apa1.lista1.insertar_nodo(@libro1)
        end 
        it "Se crea un objeto apa" do
            expect(@apa1.is_a? Apa).not_to be nil
        end
    end
    describe "Practica 11 DSL" do
        before :each do
            @articulo1 = Article.new("Articulo 1435N") do 
              nombre_autor :surname => "Vazquez",
                           :name => "Figueroa"
              nombre_autor :surname => "Fons",
                           :name => "Antonio"
              journal_ :name => "National Geography",
                       :volume => "20",
                       :issue => "3"
              title_  :name => "Vida imposible"
              abstract_ :resumen => "Vida imposible en el fondo marino"
              date_ :dia => "20",
                   :mes => "Enero",
                   :year => "2007"
            end
        end
        
        it "Se crea un objeto de tipo Article" do
            expect(@articulo1.is_a? Article).not_to be false
        end
        it "El articulo tiene como autor a Figueroa Vazquez y Antonio Fons" do
           expect(@articulo1.author).to eq(["Vazquez Figueroa","Fons Antonio"]) 
        end
        
        it "El articulo debe tener un autor como minimo" do
            expect(@articulo1.author.count).to be >= 1
        end
        
        it "El articulo no tiene mas de 3 autores" do
            expect(@articulo1.author.count).not_to be > 3 
        end
        it "El articulo no tiene ningun metodo para devolver el numero isbn puesto que no es un libro" do
            expect(@articulo1.respond_to?('numero_ISBN')).to be false
        end
        
        it "El articulo tiene un atributo journal, que especifica la revista dónde se ha publicado" do
            expect(@articulo1.respond_to?('journal')).to be true
        end
        
        it "El articulo tiene un journal que especifica revista, volumen e issue" do
            expect(@articulo1.journal).to eq("National Geography , volume 20, issue 3")
        end
        
        it "El articulo fue publicado por la revista National Geography" do
            expect(@articulo1.journal.split(",")[0]).to eq("National Geography ") 
        end
        
        it "El volumen del articulo publicado por la revista National Geography es el 20" do
           expect(@articulo1.journal.split(",")[1].split(" ")[1]).to eq("20") 
        end
        
        it "El articulo tiene un titulo y un identificador diferentes" do
            expect(@articulo1.identificador_articulo).not_to be nil
            expect(@articulo1.title).not_to be nil
            expect(@articulo1.identificador_articulo != @articulo1.title).to be true
        end
        
        it "El articulo tiene el identificador 1435N" do
            expect(@articulo1.identificador_articulo.split(" ")[1]).to eq("1435N") 
        end
        
        it "El titulo del articulo no es Vida posible" do
           expect(@articulo1.title).not_to eq("Vida posible") 
        end
        
        it "El titulo del articulo tiene 2 palabras" do
           expect(@articulo1.title.split(" ").count).to eq(2) 
        end
        
        it "El titulo del articulo es Vida imposible" do
           expect(@articulo1.title).to eq(" Vida imposible")
        end 
       
        it "El articulo va sobre la vida marina" do
            expect(@articulo1.abstract).to eq(" Vida imposible en el fondo marino")
        end
        
        it "El articulo tiene un fecha de publicacion asociada" do
           expect(@articulo1.date).not_to be nil 
        end
        it "El articulo fue publicado en el año 2007" do
            expect(@articulo1.date).to eq("20/Enero/2007") 
        end

        it "El articulo fue publicado en el mes de Enero" do
            expect(@articulo1.date.split("/")[1]).to eq("Enero") 
        end
        
        it "El articulo fue publicado antes del día 21" do
            expect(@articulo1.date.split("/")[0]).to be < "21" 
        end
    end
end
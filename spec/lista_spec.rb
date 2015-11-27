require 'spec_helper'
require 'bib'


describe Lista do
    before :each do
        
        #Objeto de clase Libro
        @libro1 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2013)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])
        @libro2 = Libro.new(["Dav Thomas", "Andy Hunt", "Chad Fowler"], "Programm Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2015)", ["ISBN-13: 978-1937785499", "ISBN-10: 1937785491"])
        @libro3 = Libro.new(["Thomas", "Hunt", "Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby)", "Pragmatic Bookshelf", "", 4, "(July 7, 2013)", ["ISBN-13: 968-1937785499", "ISBN-10: 1937785491"])
        
        #Objeto de clase Revista
        @revista1 = Revista.new(["Juan Jimenez","Alvaro Font","Almudena Fernandez"],"National Geography", "14 de Diciembre", ["ISSN:JDCYCFHNF75","ISSN:KKSDKDKK"])
        @revista2 = Revista.new(["Juan","Alvaro Font","Almudena Fernandez"],"National Geography 1.0", "13", ["ISSN:JDCYCFHNF75","ISSN:KKSDKDKK"])
        @revista3 = Revista.new(["Pepe","Alvaro Font","Almudena Fernandez"],"National Geography 1.0", "13", ["ISSN:JDCYCFHNF75","ISSN:KKSDKDKK"])
        
        #Objeto de clase Documento_electronico
        @documento_electronico1 = Documento_electronico.new(["Magdalena,Susana,Florentina"], "Aprende a programar Ruby","18 de julio", "https://magdalenatj.github.io/tutorial_ruby")
        @documento_electronico2 = Documento_electronico.new(["Sofia,Fernanda,Maria"], "Aprende a programar Ruby","18 de julio", "https://magdalenatj.github.io/tutorial_ruby")     
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
            expect(@lista1.extraer_final().value.to_s) == ("[Dave Thomas, Andy Hunt, Chad Fowler], Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide. (The Facets of Ruby), Pragmatic Bookshelf, , 4, (July 7, 2013), [ISBN-13: 978-1937785499, ISBN-10: 1937785491]")
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
        it "Comparando autores de dos libros diferentes" do
            expect(@libro1.autor <=> @libro2.autor).to eq(1)
        end
    end
end
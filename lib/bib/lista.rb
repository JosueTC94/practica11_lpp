
#Lista
class Lista
    attr_accessor :inicio,:final
    include Enumerable
    
    def initialize()
        @inicio = nil
        @final = nil
    end
    
    def extraer_inicio()
        if(lista_vacia() != true)
            aux = @inicio
            @inicio = @inicio.next
            return aux
        else
            return nil
        end
    end
     
    def extraer_final()
         if(lista_vacia() != nil)
            aux = @final
            @final = @final.prev
            if (@final == nil)
                @inicio = nil
                @final = nil
            end
            return aux
         else
             return nil
         end
     end
    
    def to_s()
        aux = @inicio
        while(lista_vacia() != true) do
            "#{aux.value}"
            aux = aux.next
            if(aux == nil)
                break
            end
        end
    end
    
    def lista_vacia()
        if(@inicio == nil)
            return true
        else
            return false
        end
    end
    
    def insertar_nodo(x)
        
        if ((x.instance_of? Node) != true)
             node = Node.new(x,nil,nil)
        else
             node = x
        end
        
        if(lista_vacia() == true)
            @inicio = node
            @inicio.next = nil
            @inicio.prev = nil
            @final = @inicio
        else
            aux = @final
            @final = node
            aux.next = @final
            @final.prev = aux
            @final.next = nil
        end
    end
    
    def insertar_varios(*array_nodos)
        array_nodos.each do |nodo|
            if(lista_vacia() == true)
                @inicio = nodo
                @final = @inicio
            else
                aux = @final
                @final = nodo
                aux.next = @final
                @final.prev = aux
            end
        end
    end
    
    def mostrar_lista_reverso()
        if(lista_vacia() == true)
            puts "Lista vacia"
        else
            aux = @final
            #Esto puede hacerse con @final nada mas, pero ahora solo queremos mostrar
            while(aux != nil) do
                puts "#{aux.value}"
                aux = aux.prev
            end
        end
    end
    
    def each
        aux = @inicio
        while(aux!=nil) do
            yield aux.value
            aux = aux.next
        end
    end
end
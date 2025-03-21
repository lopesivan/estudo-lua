-- Definindo a classe mãe abstrata Mamifero
local Mamifero = {}
Mamifero.__index = Mamifero

-- Construtor para criar instâncias de Mamifero
function Mamifero:new(nome)
    local obj = setmetatable({}, self)
    obj.nome = nome or "Sem Nome" -- Define um nome opcional
    return obj
end

-- Método abstrato falar (deve ser sobrescrito)
function Mamifero:falar()
    error("Método abstrato não implementado!")
end

-- Definindo a classe filha Gato
local Gato = setmetatable({}, { __index = Mamifero })
Gato.__index = Gato -- Para permitir herança correta

-- Construtor específico para Gato
function Gato:new(nome)
    local obj = Mamifero.new(self, nome) -- Chama o construtor da classe mãe
    return setmetatable(obj, self)
end

function Gato:falar()
    return self.nome .. " diz: Miau!"
end

-- Definindo a classe filha Cachorro
local Cachorro = setmetatable({}, { __index = Mamifero })
Cachorro.__index = Cachorro

-- Construtor específico para Cachorro
function Cachorro:new(nome)
    local obj = Mamifero.new(self, nome) -- Chama o construtor da classe mãe
    return setmetatable(obj, self)
end

function Cachorro:falar()
    return self.nome .. " diz: Au Au!"
end

-- Criando instâncias das classes filhas
local gato = Gato:new("Whiskers")
local cachorro = Cachorro:new("Rex")

-- Chamando seus métodos
print(gato:falar())     -- Saída: Whiskers diz: Miau!
print(cachorro:falar()) -- Saída: Rex diz: Au Au!


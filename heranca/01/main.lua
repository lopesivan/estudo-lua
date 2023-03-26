-- Definindo a classe mãe abstrata Mamifero
local Mamifero = {}
function Mamifero:falar()
    error("Método abstrato não implementado!")
end

-- Definindo a classe filha Gato
local Gato = {}
setmetatable(Gato, { __index = Mamifero })
function Gato:falar()
    return "Miau"
end

-- Definindo a classe filha Cachorro
local Cachorro = {}
setmetatable(Cachorro, { __index = Mamifero })
function Cachorro:falar()
    return "Au Au"
end

-- Criando instâncias das classes filhas e chamando seus métodos
local gato = Gato:new()
local cachorro = Cachorro:new()

print(gato:falar())     -- Saída: Miau
print(cachorro:falar()) -- Saída: Au Au


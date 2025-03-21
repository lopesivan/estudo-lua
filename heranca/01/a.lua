-- Definindo a classe mãe abstrata Mamifero
local Mamifero = {}
Mamifero.__index = Mamifero -- Definindo a metatable
function Mamifero:falar()
    error("Método abstrato não implementado!")
end

-- Definindo a classe filha Gato
local Gato = setmetatable({}, { __index = Mamifero })
function Gato:falar()
    return "Miau"
end

-- Definindo a classe filha Cachorro
local Cachorro = setmetatable({}, { __index = Mamifero })
function Cachorro:falar()
    return "Au Au"
end

-- Criando instâncias das classes filhas e chamando seus métodos
local gato = setmetatable({}, { __index = Gato })
local cachorro = setmetatable({}, { __index = Cachorro })

print(gato:falar())     -- Saída: Miau
print(cachorro:falar()) -- Saída: Au Au

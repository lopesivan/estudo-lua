-- Classe base: Carro
local Carro = {}
Carro.__index = Carro

function Carro:new(nome, marca, preco)
    local obj = setmetatable({}, self)
    obj.nome = nome or "Sem nome"
    obj.marca = marca or "Genérica"
    obj.preco = preco or 0.0
    return obj
end

function Carro:info()
    return string.format("Nome: %s | Marca: %s | Preço: R$ %.2f", self.nome, self.marca, self.preco)
end

-- Classe derivada: Sedan
local Sedan = setmetatable({}, { __index = Carro })
Sedan.__index = Sedan

function Sedan:new(nome, marca, preco)
    local obj = Carro.new(self, nome, marca, preco)
    return setmetatable(obj, self)
end

-- Podemos sobrescrever ou estender o método info, se quisermos
function Sedan:info()
    return "[SEDAN] " .. Carro.info(self)
end

-- Classe derivada: SUV
local SUV = setmetatable({}, { __index = Carro })
SUV.__index = SUV

function SUV:new(nome, marca, preco)
    local obj = Carro.new(self, nome, marca, preco)
    return setmetatable(obj, self)
end

function SUV:info()
    return "[SUV] " .. Carro.info(self)
end

-- Criando instâncias
local civic = Sedan:new("Civic", "Honda", 120000.00)
local tracker = SUV:new("Tracker", "Chevrolet", 145000.00)

-- Exibindo informações
print(civic:info())    -- Saída: [SEDAN] Nome: Civic | Marca: Honda | Preço: R$ 120000.00
print(tracker:info())  -- Saída: [SUV] Nome: Tracker | Marca: Chevrolet | Preço: R$ 145000.00


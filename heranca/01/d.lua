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

-- Método para aplicar desconto
function Carro:desconto(percentual)
    if percentual < 0 or percentual > 100 then
        return "Percentual inválido!"
    end
    local novo_preco = self.preco * (1 - percentual / 100)
    return string.format("Novo preço com %.1f%% de desconto: R$ %.2f", percentual, novo_preco)
end

-- Classe derivada: Sedan
local Sedan = setmetatable({}, { __index = Carro })
Sedan.__index = Sedan

function Sedan:new(nome, marca, preco)
    local obj = Carro.new(self, nome, marca, preco)
    return setmetatable(obj, self)
end

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

-- Exibindo informações antes do desconto
print(civic:info())   -- [SEDAN] Nome: Civic | Marca: Honda | Preço: R$ 120000.00
print(tracker:info()) -- [SUV] Nome: Tracker | Marca: Chevrolet | Preço: R$ 145000.00

-- Aplicando descontos
print(civic:desconto(10))   -- Novo preço com 10.0% de desconto: R$ 108000.00
print(tracker:desconto(15)) -- Novo preço com 15.0% de desconto: R$ 123250.00

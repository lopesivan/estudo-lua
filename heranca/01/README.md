Em Lua, a herança é implementada usando as "metatables"
(tabelas de metadados), que permitem que um objeto seja
associado a outro objeto que servirá como sua "classe
mãe". As classes em Lua são apenas tabelas regulares com
métodos e atributos.

Na implementação acima, a classe mãe abstrata "Mamifero" é
definida como uma tabela vazia com um método abstrato falar(),
que lança um erro quando chamado. As classes filhas "Gato" e
"Cachorro" são definidas como tabelas com métodos falar()
próprios, e com suas metatables associadas à classe mãe
"Mamifero".

Na função main(), instâncias das classes filhas são
criadas usando o método :new() que cria um novo objeto com a
tabela como metatable. Em seguida, seus métodos falar() são
chamados, produzindo a mesma saída que os exemplos anteriores.

Cabe ressaltar que, em Lua, não há uma distinção clara
entre classes abstratas e concretas. O que estamos fazendo é
simular a abstração usando métodos abstratos que lançam
erros quando chamados. Isso é uma prática comum em Lua, mas
é importante lembrar que não há uma verificação de tipos
estrita que impeça o uso de classes "abstratas" diretamente.

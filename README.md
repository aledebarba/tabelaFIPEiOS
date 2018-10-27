# tabelaFIPEiOS
MBA FIAP Trabalho final de IOS-2018

FIAP: MBA em Desenvolvimento de Aplicações e Games para Dispositivos Móveis - IOT
Professor: Eric Alves Brito
Disciplinas: Desenvolvimento de Aplicações iOS para Cloud Computing
Trabalho/Prova

O objetivo desse repositorio é documentar o desenvolvimento do app com os seguintes requisitos:

1. Descrição do Aplicativo a ser desenvolvido
Você deverá criar um App que acesse a API da tabela FIPE (http://fipeapi.appspot.com/)
e possua 4 telas. Em cada uma dessas telas será necessário realizar as devidas
chamadas para o retorno do que se pede. Acesse o site listado acima para saber como
utilizar esta API. A navegação entre as telas deverá ser feita com UINavigationController
e o title de cada tela deverá condizer com as informações apresentadas pela mesma.
Com relação às requests, deverá ser feito tudo usando URLSession, URLDataTask, etc,
ou seja, nada de Frameworks de terceiros (Alamofire, etc).

- Na primeira você deverá apresentar todas as marcas de carro e apresentar
(UITableViewController) as devidas marcas (fipe_name). O title dessa tela é “Lista
de marcas”

- Ao selecionar uma marca será exibida uma nova tela (UITableViewController)
com os veículos dessa marca, mostrando o nome (fipe_name) dos veículos. O
title dessa tela é o nome da marca selecionada.

- Ao selecionar um veículo, será exibida uma nova tela (UITableViewController)
com os modelos de veículos desse tipo, mostrando o nome (name) de cada
modelo. O title será o veículo escolhido.

- Ao escolher um modelo, será apresentada uma última tela (UIViewController)
onde serão listados os seguintes dados do veículo. O title será o modelo
escolhido e as informações apresentadas nessa tela serão:
• Nome (name)
• Preço (preco)
• Tipo de combustível (combustivel)
• Ano do Modelo (ano_modelo)

# ViasoftExtratos
Este projeto foi criado com o intuito de atenter o desafio técnico imposto pela Viasoft. 

Princípios SOLID utilizados:

1. Single Responsibility Principle (SRP)

Análise: Cada classe tem uma única responsabilidade. O TViasoftModel é responsável pela manipulação de dados (adição, edição e remoção de transações), o TViasoftController gerencia a lógica de controle e o TForm1 lida com a interface do usuário.

2. Open/Closed Principle (OCP)

Análise: O sistema está estruturado de forma que novas funcionalidades (como novos tipos de transações) poderiam ser adicionadas através da extensão das classes existentes, sem modificar o código existente. Por exemplo, se fosse necessário adicionar outro tipo de transação, seria possível fazer isso na classe TViasoftModel sem alterar a lógica existente.

4. Interface Segregation Principle (ISP)

Análise: A interface IViasoftController é bem definida, com métodos que são específicos e necessários para o controlador. Isso permite que diferentes implementações de controladores possam ser criadas sem sobrecarregar uma única interface com métodos desnecessários.

5. Dependency Inversion Principle (DIP)

Análise: O código utiliza a injeção de dependência ao permitir que TForm1 dependa da interface IViasoftController em vez de uma implementação concreta. Isso facilita a substituição da implementação do controlador sem alterar a View.

===================================================================
Padrão de projeto utilizado: MVC (Model-View-Controller)

Análise do Padrão MVC:
Model:

A unidade ViasoftModel atua como a camada de Model. Ela é responsável pela lógica de manipulação de dados, como adicionar, editar e remover transações. O Model não tem conhecimento da View ou do Controller, apenas gerencia os dados.

View:

A unidade ViasoftExtratos é a camada de View. Ela é responsável pela interface do usuário, onde as transações são exibidas e onde o usuário pode interagir (adicionar, editar, remover transações). A View também é responsável por apresentar dados e capturar entradas do usuário.

Controller:

A unidade ViasoftController é a camada de Controller. Ela gerencia a lógica de controle da aplicação, fazendo a intermediação entre a View e o Model. O Controller recebe as ações do usuário da View, processa essas ações (como adicionar, editar ou remover uma transação) e comunica-se com o Model para atualizar os dados.

Interações no MVC:
- Quando um usuário interage com a View (por exemplo, clicando em um botão para adicionar uma transação), a View chama um método do Controller.

- O Controller processa essa solicitação, possivelmente realizando validações e, em seguida, chama os métodos apropriados no Model para manipular os dados.

- Após a manipulação dos dados, o Controller pode notificar a View para que ela atualize a interface com as informações mais recentes (como a lista de transações).

==============================================
Estruturas de dados utilizadas: TList e Record.

1. Listas Genéricas (TList<TTransacao>)

Descrição: O código utiliza TList<TTransacao> para armazenar as transações (FTransacoes). Essa estrutura de dados permite a adição, edição e remoção de elementos de forma dinâmica. TList é uma lista genérica que oferece uma maneira eficiente de gerenciar coleções de objetos ou registros do tipo TTransacao.

Vantagens: As listas genéricas oferecem operações de acesso rápido e são fáceis de manipular, permitindo iterações, adições e remoções sem precisar se preocupar com a alocação de memória.

2. Registros (TTransacao)

Descrição: TTransacao é definido como um registro que contém dois campos: Tipo (uma string que indica se é "Crédito" ou "Débito") e Valor (um valor do tipo Currency para armazenar o valor da transação).

Vantagens: Registros são uma forma leve e eficiente de agrupar dados relacionados sem a sobrecarga de classes, sendo apropriados para estruturas simples como transações financeiras.

TList: Utilizada para armazenar uma coleção de transações (TTransacao), permitindo a manipulação dinâmica da lista.

Record: A estrutura TTransacao representa a entidade de uma transação financeira, agrupando seus atributos relevantes.

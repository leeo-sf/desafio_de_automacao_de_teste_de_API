# Desafio de Automação de Teste de API

Este repositório tem como objetivo a validação da API (https://serverest.dev/#/) RESTfull de usuários, login e em partes produtos. Abaixo há mais detalhes da cobertura dos testes realizados.

<h2>Pré requisitos </h2>

- Node.js (Se usar a Opção 1).
- Postman (Se usar a Opção 2).

<h2>Opções de execuções 📝 </h2>

*Para executar os testes, siga uma das instuções abaixo.* <br>

*Primeiramente, execute o comando `git clone https://github.com/leeo-sf/desafio_de_automacao_de_teste_de_API` no terminal em uma pasta de sua preferência.*

- Opção 1 - Executar pela linha de comando
  - *Navegue até o diretório `cd desafio_de_automacao_de_teste_de_API`*
  - Através do terminal, acesse a pasta onde o projeto foi clonado.
  - Caso não tenha o newman instalado em sua máquina, execute o comando `npm install -g newman` (Utilizado para executar o teste).
  - Caso não tenha o newman-reporter-htmlextra instalado em sua máquina, execute o comando `npm install -g newman-reporter-htmlextra` (Utilizado para geração do relatório HTML).
  - Agora, basta executar o comando `newman run ./"Desafio Banco Carrefour.postman_collection.json" -e ./"Desafio_CSF.postman_environment.json" -r cli,htmlextra --reporter-htmlextra-export testArtifacts/report.html`.
    
- Opção 2 - Executar pelo postman
  - Importe o arquivo *Desafio Banco Carrefour.postman_collection.json* na aba `Collections` no postman.
  - Importe o arquivo *Desafio_CSF.postman_environment.json* na aba `Environments` no postman.
  - Abra a collection no postman e no canto superior direito selecione a environment `Desafio_CSF`.

<h2>Relatório de execução</h2>

- `Execução local` - Após executar o teste pela Opção 1. Navegue até o diretório do projeto, abra a pasta `testArtifacts` e abra o arquivo `report.html` por um navegador de sua preferência.
- `Visualizar pela pipeline` - No github dentro do repositório. Navegue até `Actions`, abra o ultimo workflow executado, role a tela até `Artifacts` e faça o download. Na pasta .zip tem um arquivo de extenção .html. Abra-o em um navegador.
  

<h2>Testes implementados </h2>

- Endpoint de login
  - Cenários felizes
    - Login com sucesso - Realiza o login com sucesso e recebe o Token JWT gerado. Valida status, mensagem de retorno e token.
  Cenários de erro
    - Login com email inválido - Ao realizar login e informar um endereço de email inválido deve dar erro. Valida status e mensagem de retorno.
    - Login com senha incorreta - Ao realizar login e informar o email correto e a senha incorreta deve dar erro. Valida status e mensagem de retorno.
    - Login com email incorreto - Ao realizar login e informar a senha correta e o email incorreto deve dar erro. Valida status e mensagem de retorno.
    - Login sem object user no body - Ao realizar login e enviar o body vazio deve dar erro. Valida status e campos e mensagem retornados.
    - Login sem email no body - Ao realizar login e não enviar o campo email deve dar erro. Valida status e campo e mensagem retornado.
    - Login sem password no body - Ao realizar login e não enviar o campo password deve dar erro. Valida status e campo e mensagem retornado.
    - Login com email vazio - Ao realizar login e enviar o campo email vazio deve dar erro. Valida status e campo e mensagem retornado.
    - Login com password vazio - Ao realizar login e enviar o campo password vazio deve dar erro. Valida status e campo e mensagem retornado.

- Endpoint de listagem de usuários
  - Cenários felizes
    - Lista usuários por id (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por nome (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por email (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por password (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por administrador (query) - Valida status, campos presentes, tipo dos campos retornados, quantidade corresponde a quantidade de usuários retornado no array e se o campo administrador dos usuários retornados são iguais ao valor informado na query.
    - Lista usuários por id (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
  - Cenários de erro
    - Query incorreta - Tem como objetivo validar o nome da query incorreto.
    - Endereço de email inválido - Se um endereço de email inválido for inserido, deve ser retornado erro.
    - Campo administrador incorreto - Se o campo não for setado como true ou falso é retornado erro.

- Endpoint de busca de usuário por ID
  - Cenários felizes
    - ID existente - Ao informar o ID de um usuário cadastrado no sistema deve ser retornado seus dados. Valida status e tipos e campos retornados.
  - Cenários de erro
    - ID inexistente - Ao informar o ID de um usuário incorreto ou inexistente deve ser retornado um erro e uma mensagem. Valida status e mensagem retornada.

- Endpoint de cadastro de usuário
  - Cenários felizes
    - Cadastro com sucesso - Ao informar os dados do body corretamente o usuário é criado e retornado o ID. Valida status, campo ID e mensagem retornados.
  - Cenários de erro
    - Email já cadastrado - Ao realizar o cadastro de um usuário com um email já em uso, deve ser retornado erro. Valida status e mensagem retornada.
    - Campo nome não presente - Ao realizar o cadastro do usuário sem enviar o campo nome deve dar erro. Valida status e mensagem retornada.
    - Campo nome vazio - Ao realizar o cadastro do usuário enviando o nome vazio deve dar erro. Valida status e mensagem retornada.
    - Campo email não presente - Ao realizar o cadastro do usuário sem enviar o campo email deve dar erro. Valida status e mensagem retornada.
    - Campo email vazio - Ao realizar o cadastro do usuário enviando o email vazio deve dar erro. Valida status e mensagem retornada.
    - Campo password não presente - Ao realizar o cadastro do usuário sem enviar o campo password deve dar erro. Valida status e mensagem retornada.
    - Campo password vazio - Ao realizar o cadastro do usuário enviando o password vazio deve dar erro. Valida status e mensagem retornada.
    - Campo administrador não presente - Ao realizar o cadastro do usuário sem enviar o campo administrador deve dar erro. Valida status e mensagem retornada.
    - Campo administrador vazio - Ao realizar o cadastro do usuário enviando o administrador vazio deve dar erro. Valida status e mensagem retornada.
    - Campo administrador incorreto - Ao realizar o cadastro de um usuário com o campo administrador de forma fora do esperado, deve retornar erro. Valida status e mensagem retornada.
    - Body vazio - Ao realizar o cadastro do usuário enviando o body vazio deve dar erro. Valida status e mensagem retornada.
   
- Endpoint de editar usuário
  - Cenários de erro
    - Editar para email já cadastrado - Ao editar os dados de um usuário e informar um email que já está sendo usado deve retornar erro. Valida status e mensagem retornada.
  - Cenários felizes
    - Editar com sucesso - Ao editar os dados do usuário respeitando as regras deve ser retornado success. Valida status, campo e mensagem retornados.
   
- Endpoint de excluir usuário
  - Cenários felizes
    - Excluir com sucesso - Ao enviar o ID válido do usuário deve ser retornado success. Valida status, campo e mensagem retornados.

- Endpoint de Cadastrar produto
  - *Esses validam apenas a criação de um produto, validando a ausência de token e dados.*
  - Cenários felizes
    - Cadastrar produto com sucesso - Ao realizar o cadastro de um produto com os dados válido deve dar success no retorno. Valida status campo de mensagem e de ID retornado.
  - Cenários de erro
    - Token de acesso ausente - Ao tentar cadastrar um usuário sem informar o token deve dar erro. Valida status e mensagem de retorno.
    - Token de acesso inválido - Ao tentar cadastrar um usuário informandoum token expirado ou incorreto deve dar erro. Valida status e mensagem de retorno.
    - Nome existente - Ao tentar cadastrar um produto cujo o nome já exista na base de dados deve dar erro. Valida status e mensagem de retorno.
    - Cadastra produto adm false - Ao tentar realizar o cadastro de um produto informando o token de um usuário não administrador deve dar erro. Valida status e mensagem de retorno.
    - Nome não presente - Ao tentar realizar o cadastro de um produto sem enviar o campo nome deve dar erro. Valida status e mensagem de retorno.
    - Campo nome vazio - Ao tentar realizar o cadastro de um produto com o campo nome vazio deve dar erro. Valida status e mensagem de retorno.
    - Preco não presente - Ao tentar realizar o cadastro de um produto sem enviar o campo preco deve dar erro. Valida status e mensagem de retorno.
    - Campo preco incorreto - Ao tentar realizar o cadastro de um produto com o campo preco incorreto deve dar erro. Valida status e mensagem de retorno.
    - Descricao não presente - Ao tentar realizar o cadastro de um produto sem enviar o campo descricao deve dar erro. Valida status e mensagem de retorno.
    - Campo descricao vazio - Ao tentar realizar o cadastro de um produto com o campo descricao vazio deve dar erro. Valida status e mensagem de retorno.
    - Quantidade não presente - Ao tentar realizar o cadastro de um produto sem enviar o campo quantidade deve dar erro. Valida status e mensagem de retorno.
    - Campo quantidade incorreto - Ao tentar realizar o cadastro de um produto com o campo quantidade incorreto deve dar erro. Valida status e mensagem de retorno.
    - Body vazio - Ao tentar realizar o cadastro de um produto enviando o body vazio deve dar erro. Valida status e mensagems e campos de retornos.
   
- End to End
  - Tem como objetivo realizar o teste desde a criação até a exclusão.
    - Cadastra um usuário.
    - Busca usuário após o cadastro, valida se os dados retornados são iguais aos dados cadastrados.
    - Login (Necessário para o próximo teste).
    - Cadastrar produto.
    - Busca produto após cadastro.
    - Excluir produto.
    - Edita usuário.
    - Busca pelo ID do usuário, valida se os dados retornados são iguais aos dados que foram editados.
    - Excluí o usuário.

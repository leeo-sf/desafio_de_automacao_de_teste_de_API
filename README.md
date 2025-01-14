# Desafio de Automação de Teste de API

Este repositório tem como objetivo a validação da API (https://serverest.dev/#/) RESTfull de usuários. Abaixo há mais detalhes da cobertura dos testes realizados.

<h3>Formas de executar o teste 📝 </h3>

*Para executar os testes, siga uma das instuções abaixo.* <br>

*Primeiramente, execute o comando `git clone https://github.com/leeo-sf/desafio_de_automacao_de_teste_de_API` no terminal em uma pasta de sua preferência.*

- Opção 1 - Executar pelo terminal
  - *Necessário ter o node instalado.*
  - Através do terminal, acesse a pasta onde o projeto foi clonado.
  - Execute o comando `npm install -g newman`. Para execução do teste.
  - Execute o comando `npm install -g newman-reporter-htmlextra`. Para geração do relatório.
  - Agora basta executar o comando `newman run ./"Desafio Banco Carrefour.postman_collection.json" -e ./"Desafio_CSF.postman_environment.json" -r cli,htmlextra --reporter-htmlextra-export testArtifacts/report.html`.
    
- Opção 2 - Executar pelo postman
  - Importe o arquivo *Desafio Banco Carrefour.postman_collection.json* na aba `Collections` no postman.
  - Importe o arquivo *Desafio_CSF.postman_environment.json* na aba `Environments` no postman.
  - Abra a collection no postman e no canto superior direito selecione a environment `Desafio_CSF`.

<h3>Testes implementados </h3>

- Endpoint de listagem de usuários
  - Cenários felizes
    - Lista usuários por id (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por nome (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por email (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por password (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
    - Lista usuários por administrador (query) - Valida status, campos presentes, tipo dos campos retornados, quantidade corresponde a quantidade de usuários retornado no array e se o campo administrador dos usuários retornados são iguais ao valor informado na query.
    - Lista usuários por id (query) - Valida status, campos presentes, tipo dos campos retornados e se o campo de quantidade corresponde a quantidade de usuários retornado no array.
  - Cenários de Erro
    - Query incorreta - Tem como objetivo validar o nome da query incorreto.
    - Endereço de email inválido - Se um endereço de email inválido for inserido, deve ser retornado erro.
    - Campo administrador incorreto - Se o campo não for setado como true ou falso é retornado erro.

- Endpoint de busca de usuário por ID
  - Cenários felizes
    - ID existente - Ao informar o ID de um usuário cadastrado no sistema deve ser retornado seus dados. Valida status e tipos e campos retornados.
  - Cenários de Erro
    - ID inexistente - Ao informar o ID de um usuário incorreto ou inexistente deve ser retornado um erro e uma mensagem. Valida status e mensagem retornada.

- Endpoint de cadastro de usuário
  - Cenários felizes
    - Cadastro com sucesso - Ao informar os dados do body corretamente o usuário é criado e retornado o ID. Valida status, campo ID e mensagem retornados.
  - Cenários de Erro
    - Email já cadastrado - Ao realizar o cadastro de um usuário com um email já em uso, deve ser retornado erro. Valida status e mensagem retornada.
    - Campo administrador incorreto - Ao realizar o cadastro de um usuário com o campo administrador de forma fora do esperado, deve retornar erro. Valida status e mensagem retornada.
   
- Endpoint de editar usuário
  - Cenários de Erro
    - Editar para email já cadastrado - Ao editar os dados de um usuário e informar um email que já está sendo usado deve retornar erro. Valida status e mensagem retornada.
  - Cenários felizes
    - Editar com sucesso - Ao editar os dados do usuário respeitando as regras deve ser retornado success. Valida status, campo e mensagem retornados.
   
- Endpoint de excluir usuário
  - Cenários felizes
    - Excluir com sucesso - Ao enviar o ID válido do usuário deve ser retornado success. Valida status, campo e mensagem retornados.
   
- End to End
  - Tem como objetivo realizar o teste do início ao fim, em todos os endpoint.
    - Cadastra um usuário.
    - Busca pelo ID do usuário cadastrado, valida se o dados retornados são iguais aos dados cadastrados.
    - Edita usuário.
    - Busca pelo ID do usuário, valida se os dados retornados são iguais aos dados que foram editados.
    - Excluí o usuário.

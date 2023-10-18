O projeto para o cliente, que é uma construtora fictícia com nome "Obra Prima", consiste em um aplicativo android na linguagem flutter.


As funções desse aplicativo foram pensadas para que a construtora pudesse realizar a chamada dos funcionários presentes em uma ou em várias obras simultâneas.


A ideia do aplicativo é que o funcionário consiga fazer o check-in e check-out de uma obra clicando somente em um botão, que pega a localização atual do celular desse funcionário.


O aplicativo pega a localização do usuário através do serviço de localização do google e mostra para a empresa através de um banco de dados como o SQL ou Firebase, e a empresa tem acesso ao id do funcionário cadastrado no sistema,, o status (em obra, em pausa ou fora de obra) a latitude, longitude,
endereço atual e horário em que ele realizou o check-in pelo banco de dados. Esses dados, por estarem em um SGBD, são fáceis de serem capturados e facilitam o controle da empresa aos funcionários presentes.



1. Página de login

   
   
   A pagina de login conta com validações de preenchimento, opção para '@' no teclado, botão para visibilidade de senha e um botão que ao ser pressionado valida se o usuário está cadastrado no sistema ou não.


   
   ![image](https://github.com/vtrod/msiChallenge/assets/34226821/257070b9-6573-47f1-80e3-f66cb8b04526)
Aqui o usuário faz o login em sua conta existente no banco de dados;


2. Página de controle do funcionário
   

   Aqui o usuário tem as opções de "Check-in" - para realizar o check-in no local da obra;
   
                                "Pausa"    - caso precise sair da obra por um período de tempo;
   
                                "Retorno"  - para retornar a obra, caso tenha utilizado a opção de pausa;
   
                                "Saída"    - para sair da obra e realizar o check-out.


   
   ![image](https://github.com/vtrod/msiChallenge/assets/34226821/971c4b06-6324-4d8b-9430-0336002edf51)

   

3. Exemplo da tabela no banco de dados



Tabela: Employees

| id funcionário |    status     | latitude | longitude |  local  |     horário de lançamento    |
| -------------- | ------------- | -------- | --------- | ------- | -----------------------------|
| 1              |    em obra    | 123.456  | -78.901   | Local 1 |      2023-10-18 14:30:00     |
| 2              |    em pausa   | 234.567  | -89.012   | Local 2 |      2023-10-18 15:45:00     |
| 3              |  fora de obra | 345.678  | -90.123   | Local 3 |      2023-10-18 16:20:00     |
| 4              |    em obra    | 456.789  | -91.234   | Local 4 |      2023-10-18 17:10:00     |




Observações:

  -As páginas foram desenvolvidas utilizando o Android Studio e o flutter na versão 3.13.7.
  
  
  -Para testes, utilizar o username: admin@admin.com
                           senha: admin
  
  
  -O aplicativo é apenas uma demonstração básica do projeto, a versão completa utilizaria a mesma ideia mas com conceitos mais avançados,
tratamentos de erros, validações maiores, uma interface mais aprimorada e a utilização de um banco de dados Google Firebase, SQLite ou uma API com o mySQL para registro do funcionário e lançamento da tabela proposta acima.

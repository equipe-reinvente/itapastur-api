## Sobre ℹ️
O backend do ItapasTur foi desenvolvido utilizando a linguagem Ruby juntamente com o framework Ruby on Rails, foi utilizado uma API seguindo o padrão MVC do rails, porém, sem utilizar as views, visto que é uma API

## Tecnologias 💻
Essas são as tecnologias utilizadas na API:
- ![PostgreSQL Badge](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=fff&style=for-the-badge) -> Banco de dados relacional principal.
- ![Ruby on Rails Badge](https://img.shields.io/badge/Ruby%20on%20Rails-D30001?logo=rubyonrails&logoColor=fff&style=for-the-badge) -> Framework web.
  - ![Interactors](https://img.shields.io/badge/interactors-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para modularização.
  - ![JWT](https://img.shields.io/badge/jwt-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para encodificar e decodificar tokens jwt.
  - ![Bcrypt](https://img.shields.io/badge/bcrypt-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para encriptar senhas.
  - ![AWS-SDK-S3](https://img.shields.io/badge/AWS_SDK_S3-%23CC342D.svg?style=for-the-badge&logo=rubygems&logoColor=white) -> Utilizado para conectar com o S3 da AWS.

## Diagrama do Banco de Dados

![Diagrama](./Itapastur.jpg)
## Rotas 🛤️
As notas rotas podem ser vistas através da documentação do Postman:
- [Rotas](https://documenter.getpostman.com/view/27353559/2s9Ykoc1UT)
  
## Rodando o Projeto 🚀

- Caso possua o Ruby, o Rails e o Postgresql, utilize os seguintes comandos abaixo:

1. Clone o repositório:
```
git clone -b develop https://github.com/equipe-reinvente/itapastur-api
cd itapastur-api
```
2. Instale as dependências:

```
bundle install
```

3. Configure o banco de dados:

```
rails db:setup
```

4. Inicie o servidor:

```
rails s
```

- Com isso o projeto estará rodando na URL 'localhost:3000'

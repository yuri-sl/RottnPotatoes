# 🎬 RottenPotatoes

Uma aplicação web de catálogo de filmes construída com Ruby on Rails, inspirada no Rotten Tomatoes. Permite cadastrar, visualizar, editar e remover filmes, com suporte a ordenação por título e data de lançamento.

---

## Funcionalidades

- Listagem de todos os filmes cadastrados
- Ordenação por título ou data de lançamento (crescente/decrescente)
- Cadastro de novos filmes com título, classificação e data de lançamento
- Visualização detalhada de cada filme
- Edição e remoção de filmes
- Interface com tema escuro inspirado em cinema

---

## Tecnologias utilizadas

- **Ruby on Rails 8.1**
- **SQLite3** como banco de dados
- **Propshaft** para pipeline de assets
- **Puma** como servidor web

---

## Como instalar e rodar localmente

### Pré-requisitos

- Ruby 3.2+
- Rails 8.1+
- SQLite3
- Bundler

### Passo a passo

**1. Clone o repositório:**

```bash
git clone https://github.com/seu-usuario/RottnPotatoes.git
cd RottnPotatoes
```

**2. Instale as dependências:**

```bash
bundle install
```

**3. Crie e popule o banco de dados:**

```bash
rails db:create
rails db:migrate
```

**4. Inicie o servidor:**

```bash
rails server
```

**5. Acesse no navegador:**

```
http://127.0.0.1:3000
```

---

## Estrutura das rotas principais

| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/movies` | Lista todos os filmes |
| GET | `/movies/add` | Formulário de novo filme |
| POST | `/movies` | Cria um novo filme |
| GET | `/movies/:id` | Visualiza um filme |
| GET | `/movies/:id/edit` | Formulário de edição |
| PATCH | `/movies/:id` | Atualiza um filme |
| DELETE | `/movies/:id` | Remove um filme |

---

## Decisões de implementação

- As rotas seguem as convenções REST do Rails, com exceção da rota `/movies/add` que foi criada como alternativa semântica ao `/movies/new`
- A ordenação é feita com `LOWER()` no SQL para garantir que seja case-insensitive
- O botão de deletar utiliza `button_to` com `method: :delete` compatível com Turbo (Rails 7+)
- O CSS foi escrito manualmente com tema dark e paleta vermelha/laranja inspirada em cinema

---

## Autor
- Yuri-sl


Desenvolvido como projeto de estudo de Ruby on Rails.

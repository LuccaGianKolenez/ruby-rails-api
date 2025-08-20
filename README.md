<<<<<<< HEAD
# ruby-rails-api
=======
# Portfolio Ruby on Rails API

API desenvolvida em **Ruby on Rails (API mode)** com **PostgreSQL**, **JWT**, **Docker/Compose** e **CI/CD**.  
O projeto implementa autenticação JWT e CRUD de usuários e tarefas, servindo como base para projetos mais complexos e como exemplo de boas práticas em Rails moderno.

---

## Tecnologias

- **Linguagem**: Ruby 3.3
- **Framework**: Rails 7.2 (API-only)
- **Banco de dados**: PostgreSQL 16
- **Auth**: JWT (Bearer Token)
- **Testes**: RSpec, FactoryBot, Faker, SimpleCov
- **Qualidade**: RuboCop (lint), Brakeman (segurança)
- **Infra**: Docker + Docker Compose
- **CI/CD**: GitHub Actions

---

## Estrutura de pastas

```text
.
├── app
│   ├── controllers        # Controllers da API (Application, Auth, Users, Tasks)
│   ├── models             # Models (User, Task, ApplicationRecord)
│   ├── serializers        # Serialização de objetos (opcional)
│   └── ...
├── config
│   ├── application.rb     # Configuração principal da aplicação
│   ├── database.yml       # Configuração de banco
│   ├── environments/      # Configs por ambiente (dev/test/prod)
│   └── routes.rb          # Rotas da API
├── db
│   ├── migrate/           # Migrations de schema
│   └── seeds.rb           # Seeds iniciais (usuário demo + tasks)
├── spec                   # Testes RSpec
│   ├── requests           # Testes de controllers/endpoints
│   ├── models             # Testes de models
│   └── support            # Helpers de testes
├── Dockerfile
├── docker-compose.yml
├── Gemfile
├── Rakefile
└── README.md
```

---

## Rotas

### Health
| Método | Endpoint   | Descrição        | Auth |
|--------|------------|------------------|------|
| GET    | `/health`  | Status da API    | ❌   |

### Auth
| Método | Endpoint         | Descrição        | Body |
|--------|-----------------|------------------|------|
| POST   | `/auth/sign_in` | Login e gera JWT | `{ "email": "...", "password": "..." }` |

### Users
| Método | Endpoint   | Descrição           | Auth |
|--------|------------|---------------------|------|
| POST   | `/users`   | Criar usuário       | ❌   |
| GET    | `/users`   | Listar usuários     | ✅   |
| GET    | `/users/:id` | Detalhar usuário  | ✅   |

### Tasks
| Método | Endpoint    | Descrição               | Auth |
|--------|-------------|-------------------------|------|
| GET    | `/tasks`    | Listar tasks do usuário | ✅   |
| POST   | `/tasks`    | Criar task              | ✅   |
| GET    | `/tasks/:id`| Detalhar task           | ✅   |
| PUT    | `/tasks/:id`| Atualizar task          | ✅   |
| DELETE | `/tasks/:id`| Remover task            | ✅   |

---

## Autenticação JWT

1. Crie um usuário (`POST /users`).
2. Faça login (`POST /auth/sign_in`) → retorna um `token`.
3. Use o token nas rotas protegidas:
   ```http
   Authorization: Bearer <TOKEN>
   ```

---

## Como rodar

### Com Docker
```bash
docker compose up --build -d
docker compose run --rm api bash -lc "bundle exec rails db:create db:migrate db:seed"
curl http://localhost:3000/health
```

### Sem Docker
```bash
bundle install
export DATABASE_URL="postgres://postgres:postgres@localhost:5432/rails_api_dev"
export JWT_SECRET="supersecretjwt"
bin/rails db:create db:migrate db:seed
bin/rails s -p 3000
```

---

## Testes, Lint e Segurança

```bash
# Testes
docker compose run --rm api bash -lc "bundle exec rspec"

# Cobertura de testes
open coverage/index.html

# Linter
docker compose run --rm api bash -lc "bundle exec rubocop"

# Segurança
docker compose run --rm api bash -lc "bundle exec brakeman -q"
```

---

## Postman

1. Importe o arquivo **`Portfolio-Rails-API.postman_collection.json`**.  
2. Configure variáveis:
   - `base_url = http://localhost:3000`
   - `jwt` será preenchido automaticamente após **Sign In**.  
3. Ordem sugerida:
   1. Criar usuário
   2. Sign In
   3. Criar/Listar/Atualizar/Deletar Tasks

---

## CI/CD (GitHub Actions)

Pipeline executa automaticamente em `push` e `pull_request`:
- RSpec (testes)
- Brakeman (segurança)
- RuboCop (lint)


>>>>>>> 9c5a663 (docs(readme): documentação completa (stack, rotas, setup, testes, CI))

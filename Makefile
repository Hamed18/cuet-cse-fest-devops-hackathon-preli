# Docker Services:
#   up - Start services (use: make up [service...] or make up MODE=prod, ARGS="--build" for options)
#   down - Stop services (use: make down [service...] or make down MODE=prod, ARGS="--volumes" for options)
#   build - Build containers (use: make build [service...] or make build MODE=prod)
#   logs - View logs (use: make logs [service] or make logs SERVICE=backend, MODE=prod for production)
#   restart - Restart services (use: make restart [service...] or make restart MODE=prod)
#   shell - Open shell in container (use: make shell [service] or make shell SERVICE=gateway, MODE=prod, default: backend)
#   ps - Show running containers (use MODE=prod for production)
#
# Convenience Aliases (Development):
#   dev-up - Alias: Start development environment
#   dev-down - Alias: Stop development environment
#   dev-build - Alias: Build development containers
#   dev-logs - Alias: View development logs
#   dev-restart - Alias: Restart development services
#   dev-shell - Alias: Open shell in backend container
#   dev-ps - Alias: Show running development containers
#   backend-shell - Alias: Open shell in backend container
#   gateway-shell - Alias: Open shell in gateway container
#   mongo-shell - Open MongoDB shell
#
# Convenience Aliases (Production):
#   prod-up - Alias: Start production environment
#   prod-down - Alias: Stop production environment
#   prod-build - Alias: Build production containers
#   prod-logs - Alias: View production logs
#   prod-restart - Alias: Restart production services
#
# Backend:
#   backend-build - Build backend TypeScript
#   backend-install - Install backend dependencies
#   backend-type-check - Type check backend code
#   backend-dev - Run backend in development mode (local, not Docker)
#
# Database:
#   db-reset - Reset MongoDB database (WARNING: deletes all data)
#   db-backup - Backup MongoDB database
#
# Cleanup:
#   clean - Remove containers and networks (both dev and prod)
#   clean-all - Remove containers, networks, volumes, and images
#   clean-volumes - Remove all volumes
#
# Utilities:
#   status - Alias for ps
#   health - Check service health
#
# Help:
#   help - Display this help message


COMPOSE_DEV  = docker/compose.development.yaml
COMPOSE_PROD = docker/compose.production.yaml



dev-up:
	docker compose -f $(COMPOSE_DEV) up -d --build

dev-down:
	docker compose -f $(COMPOSE_DEV) down

dev-restart: dev-down dev-up

dev-logs:
	docker compose -f $(COMPOSE_DEV) logs -f

dev-logs-backend:
	docker compose -f $(COMPOSE_DEV) logs -f backend

dev-logs-gateway:
	docker compose -f $(COMPOSE_DEV) logs -f gateway

dev-logs-mongo:
	docker compose -f $(COMPOSE_DEV) logs -f mongo

dev-ps:
	docker compose -f $(COMPOSE_DEV) ps

dev-shell-backend:
	docker compose -f $(COMPOSE_DEV) exec backend sh

dev-shell-gateway:
	docker compose -f $(COMPOSE_DEV) exec gateway sh


prod-up:
	docker compose -f $(COMPOSE_PROD) up -d --build

prod-down:
	docker compose -f $(COMPOSE_PROD) down

prod-restart: prod-down prod-up

prod-logs:
	docker compose -f $(COMPOSE_PROD) logs -f

prod-logs-backend:
	docker compose -f $(COMPOSE_PROD) logs -f backend

prod-logs-gateway:
	docker compose -f $(COMPOSE_PROD) logs -f gateway

prod-logs-mongo:
	docker compose -f $(COMPOSE_PROD) logs -f mongo

prod-ps:
	docker compose -f $(COMPOSE_PROD) ps

prod-shell-backend:
	docker compose -f $(COMPOSE_PROD) exec backend sh

prod-shell-gateway:
	docker compose -f $(COMPOSE_PROD) exec gateway sh


build-all:
	docker compose -f $(COMPOSE_DEV) build
	docker compose -f $(COMPOSE_PROD) build

clean-volumes:
	docker compose -f $(COMPOSE_DEV) down -v || true
	docker compose -f $(COMPOSE_PROD) down -v || true

help:
	@echo "Dev:"
	@echo "  make dev-up            # start dev stack"
	@echo "  make dev-down          # stop dev stack"
	@echo "  make dev-logs          # follow all dev logs"
	@echo "  make dev-ps            # show dev containers"
	@echo ""
	@echo "Prod:"
	@echo "  make prod-up           # start prod stack"
	@echo "  make prod-down         # stop prod stack"
	@echo "  make prod-logs         # follow all prod logs"
	@echo "  make prod-ps           # show prod containers"

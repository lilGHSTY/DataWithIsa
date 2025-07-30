# Project Makefile - Convenient command shortcuts

.PHONY: help setup run test clean verify-setup test-server test-playwright

help:
	@echo "Available commands:"
	@echo "  make setup         - Set up the development environment"
	@echo "  make install       - Install Python dependencies"
	@echo "  make run           - Run the development server"
	@echo "  make test          - Run tests"
	@echo "  make test-server   - Test if server responds"
	@echo "  make test-playwright - Test Playwright MCP availability"
	@echo "  make verify-setup  - Verify complete setup works"
	@echo "  make clean         - Clean up generated files"
	@echo "  make db-init       - Initialize the database"
	@echo "  make db-reset      - Reset the database"
	@echo "  make lint          - Run code linting"
	@echo "  make format        - Format code"

setup:
	@echo "Setting up development environment..."
	@./bootstrap.sh

run:
	@echo "Starting development server..."
	@cd src && source venv/bin/activate && python app.py

test:
	@echo "Running tests..."
	@cd src && source venv/bin/activate && python -m pytest ../tests/

clean:
	@echo "Cleaning up..."
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete
	@find . -type d -name ".pytest_cache" -delete
	@rm -f src/database.db

db-init:
	@echo "Initializing database..."
	@cd src && source venv/bin/activate && python -c "from app import init_db; init_db()"

db-reset: clean db-init
	@echo "Database reset complete"

lint:
	@echo "Running linter..."
	@cd src && source venv/bin/activate && pylint *.py

format:
	@echo "Formatting code..."
	@cd src && source venv/bin/activate && autopep8 --in-place --recursive .

# Development shortcuts
shell:
	@cd src && source venv/bin/activate && python

freeze:
	@cd src && source venv/bin/activate && pip freeze > requirements.txt

install:
	@echo "Installing dependencies..."
	@cd src && source venv/bin/activate && pip install -r requirements.txt

test-server:
	@echo "Testing server response..."
	@curl -s http://localhost:5000 | head -5 || echo "Server not responding - make sure 'make run' is running in another terminal"

test-playwright:
	@echo "Testing Playwright MCP..."
	@claude mcp list | grep playwright || echo "Playwright MCP not installed - run: claude mcp add playwright"

verify-setup:
	@echo "Verifying complete setup..."
	@echo "1. Installing dependencies..."
	@$(MAKE) install
	@echo "2. Testing server (run 'make run' in another terminal first)..."
	@echo "3. Testing Playwright MCP..."
	@$(MAKE) test-playwright

# Git shortcuts
status:
	@git status

commit:
	@git add -A && git commit

push:
	@git push origin main
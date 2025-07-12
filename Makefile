# Project Makefile - Convenient command shortcuts

.PHONY: help setup run test clean

help:
	@echo "Available commands:"
	@echo "  make setup    - Set up the development environment"
	@echo "  make run      - Run the development server"
	@echo "  make test     - Run tests"
	@echo "  make clean    - Clean up generated files"
	@echo "  make db-init  - Initialize the database"
	@echo "  make db-reset - Reset the database"
	@echo "  make lint     - Run code linting"
	@echo "  make format   - Format code"

setup:
	@echo "Setting up development environment..."
	@./scripts/setup.sh

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
	@cd src && source venv/bin/activate && pip install -r requirements.txt

# Git shortcuts
status:
	@git status

commit:
	@git add -A && git commit

push:
	@git push origin main
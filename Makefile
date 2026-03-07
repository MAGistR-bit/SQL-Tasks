.PHONY: build run run-dist test lint
GRADLE_DIR := challenge

build:
	bash -c "cd $(GRADLE_DIR) && ./gradlew build"

run:
	bash -c "cd $(GRADLE_DIR) && ./gradlew bootRun"

test:
	bash -c "cd $(GRADLE_DIR) && ./gradlew test"

lint:
	bash -c "cd $(GRADLE_DIR) && ./gradlew checkstyleMain checkstyleTest"

report:
	bash -c "cd $(GRADLE_DIR) && ./gradlew jacocoTestReport"

help:
	@echo "Available Commands:"
	@echo "  make build		- Build project"
	@echo "  make run		- Launch Spring Boot project"
	@echo "  make test		- Run the tests"
	@echo "  make lint		- Check the code style"
	@echo "  make report		- Generate a report on the code coverage by tests"
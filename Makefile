.PHONY: build run run-dist test lint
GRADLE_DIR := challenge

build:
	bash -c "cd $(GRADLE_DIR) && ./gradlew build"

run:
	bash -c "cd $(GRADLE_DIR) && ./gradlew run"

test:
	bash -c "cd $(GRADLE_DIR) && ./gradlew test"

lint:
	bash -c "cd $(GRADLE_DIR) && ./gradlew checkstyleMain checkstyleTest"

report:
	bash -c "cd $(GRADLE_DIR) && ./gradlew jacocoTestReport"
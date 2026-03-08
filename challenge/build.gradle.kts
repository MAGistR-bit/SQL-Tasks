plugins {
    id("java")
    id("checkstyle")
    id("jacoco")
    id("org.springframework.boot") version "4.0.3"
    id("io.spring.dependency-management") version "1.1.7"
    id("io.freefair.lombok") version "9.2.0"
    id("org.sonarqube") version "7.2.3.7755"
}

group = "com.team"
version = "0.0.1-SNAPSHOT"
description = "challenge"

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-webmvc")
    testImplementation("org.springframework.boot:spring-boot-starter-webmvc-test")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
    implementation(kotlin("script-runtime"))
}

sonar {
    properties {
        property("sonar.projectKey", "MAGistR-bit_SQL-Tasks")
        property("sonar.organization", "mikhail-organization")
    }
}

tasks.withType<Test> {
    useJUnitPlatform()
    finalizedBy(tasks.jacocoTestReport)
}

tasks.jacocoTestReport {
    dependsOn(tasks.test)
    reports {
        xml.required.set(true)
        html.required.set(true)
    }
}

import com.github.gradle.node.npm.task.NpmTask
import com.github.gradle.node.npm.task.NpxTask
import java.nio.file.Files

plugins {
    id("java")
    id("com.github.node-gradle.node") version "7.0.1"
    id("de.undercouch.download") version "5.5.0"
}

group = "fr.aphp"
version = File(projectDir.absolutePath,"sushi-config.yaml")
    .readLines()
    .find {
        it.contains("version")
    }?.substringAfter("version: ")?: "unknown"

node {
    download.set(true)
    version.set("${properties["nodeVersion"]}")
}

defaultTasks(
    "cleanIG",
    "buildIG"
)

val sushiInstall = tasks.register<NpmTask>("sushiInstall") {
    args.set(
        listOf(
            "install",
            "fsh-sushi@${properties["sushiVersion"]}"
        )
    )
    dependsOn(
        tasks.nodeSetup,
        tasks.npmSetup,
        tasks.npmInstall
    )
}

val sushiBuild = tasks.register<NpxTask>("sushiBuild") {
    command.set("sushi")
    args.set(
        listOf(
            "build",
            "."
        )
    )
    dependsOn(
        sushiInstall
    )
}

val igPublisherPath = "input-cache/publisher.jar"
val igPublisherInstall = tasks.register<Task>("igPublisherInstall") {
    group = "build setup"
    doLast {
        val inputCacheDir = file("input-cache").toPath()
        val publisherJar = file(igPublisherPath).toPath()

        if (!Files.exists(inputCacheDir)) {
            Files.createDirectory(inputCacheDir)
        }

        if (!Files.exists(publisherJar)) {
            download.run {
                src(
                    "https://github.com/HL7/fhir-ig-publisher/releases/download/${properties["publisherVersion"]}/publisher.jar"
                )
                dest(
                    igPublisherPath
                )
                overwrite(
                    false
                )
            }
        }
    }
}

val igPublisherBuild = tasks.register<JavaExec>("igPublisherBuild") {
    group = "build"

    jvmArgs("-Dfile.encoding=UTF-8")
    classpath(igPublisherPath)
    args = listOf(
        "-no-sushi",
        "-tx ${properties["tx"]}",
        "-ig",
        "."
    )
    dependsOn(
        igPublisherInstall
    )
}

val buildIG = tasks.register<GradleBuild>("buildIG") {
    group = "build"

    tasks = listOf(
        "sushiBuild",
        "igPublisherBuild"
    )
}

val reBuildIG = tasks.register<GradleBuild>("reBuildIG") {
    group = "build"

    tasks = listOf(
        "cleanIG",
        "sushiBuild",
        "igPublisherBuild"
    )
}

val cleanIG = tasks.register<Delete>("cleanIG") {
    group = "build"

    delete(
        "fsh-generated",
        "output",
        "temp",
        "template",
        "input-cache/schemas",
        "input-cache/txcache",
        "input-cache/publisher.jar",
        ".gradle/nodejs",
        "node_modules",
        "package.json",
        "package-lock.json"
    )
}

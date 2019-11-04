package com.ratelware.config;

import picocli.CommandLine;

public class AppConfig {
    @CommandLine.Option(names = { "-c", "--config-file"}, paramLabel = "DATABASE", description = "Used database type")
    String databaseType;

    @CommandLine.Option(names = { "-g", "--scenario-group"}, paramLabel = "SCENARIO_GROUP", description = "Group of scenarios to run")
    String scenarioGroupName;
}

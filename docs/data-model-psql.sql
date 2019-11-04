-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Runs" (
    "id"  SERIAL  NOT NULL,
    "appVersion" string   NOT NULL,
    "configVersion" string   NOT NULL,
    "startTs" timestamp   NOT NULL,
    "endTs" timestamp   NULL,
    "exitStatus" int   NULL,
    CONSTRAINT "pk_Runs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "ApplicationVersions" (
    "checksum" string   NOT NULL,
    "version" string   NOT NULL,
    CONSTRAINT "pk_ApplicationVersions" PRIMARY KEY (
        "checksum"
     )
);

CREATE TABLE "ConfigurationVersions" (
    "checksum" int   NOT NULL,
    CONSTRAINT "pk_ConfigurationVersions" PRIMARY KEY (
        "checksum"
     )
);

CREATE TABLE "Platforms" (
    "id"  SERIAL  NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Platforms" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "PlatformAPIs" (
    "id"  SERIAL  NOT NULL,
    "platformId" int   NOT NULL,
    "apiVersion" string   NOT NULL,
    "apiType" string   NOT NULL,
    "apiUrl" url   NOT NULL,
    CONSTRAINT "pk_PlatformAPIs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Credentials" (
    "checksum" string   NOT NULL,
    "targetPlatformAPI" int   NOT NULL,
    "principal" string   NULL,
    "token" string   NOT NULL,
    CONSTRAINT "pk_Credentials" PRIMARY KEY (
        "checksum"
     )
);

CREATE TABLE "Calls" (
    "id"  SERIAL  NOT NULL,
    "runId" int   NOT NULL,
    "materializedScenarioId" int   NOT NULL,
    "startTs" timestamp   NOT NULL,
    "endTs" timestamp   NULL,
    "responseStatus" int   NULL,
    CONSTRAINT "pk_Calls" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Scenarios" (
    "id"  SERIAL  NOT NULL,
    "content" json   NOT NULL,
    CONSTRAINT "pk_Scenarios" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "MaterializedScenarios" (
    "id"  SERIAL  NOT NULL,
    "scenarioId" int   NOT NULL,
    "platformAPI" int   NOT NULL,
    "credentials" string   NOT NULL,
    "checksum" string   NOT NULL,
    CONSTRAINT "pk_MaterializedScenarios" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Repositories" (
    "id"  SERIAL  NOT NULL,
    "callId" int   NOT NULL,
    "rawResponse" json   NOT NULL,
    CONSTRAINT "pk_Repositories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Runs" ADD CONSTRAINT "fk_Runs_appVersion" FOREIGN KEY("appVersion")
REFERENCES "ApplicationVersions" ("checksum");

ALTER TABLE "Runs" ADD CONSTRAINT "fk_Runs_configVersion" FOREIGN KEY("configVersion")
REFERENCES "ConfigurationVersions" ("checksum");

ALTER TABLE "PlatformAPIs" ADD CONSTRAINT "fk_PlatformAPIs_platformId" FOREIGN KEY("platformId")
REFERENCES "Platforms" ("id");

ALTER TABLE "Credentials" ADD CONSTRAINT "fk_Credentials_targetPlatformAPI" FOREIGN KEY("targetPlatformAPI")
REFERENCES "PlatformAPIs" ("id");

ALTER TABLE "Calls" ADD CONSTRAINT "fk_Calls_runId" FOREIGN KEY("runId")
REFERENCES "Runs" ("id");

ALTER TABLE "Calls" ADD CONSTRAINT "fk_Calls_materializedScenarioId" FOREIGN KEY("materializedScenarioId")
REFERENCES "MaterializedScenarios" ("id");

ALTER TABLE "MaterializedScenarios" ADD CONSTRAINT "fk_MaterializedScenarios_scenarioId" FOREIGN KEY("scenarioId")
REFERENCES "Scenarios" ("id");

ALTER TABLE "MaterializedScenarios" ADD CONSTRAINT "fk_MaterializedScenarios_platformAPI" FOREIGN KEY("platformAPI")
REFERENCES "PlatformAPIs" ("id");

ALTER TABLE "MaterializedScenarios" ADD CONSTRAINT "fk_MaterializedScenarios_credentials" FOREIGN KEY("credentials")
REFERENCES "Credentials" ("checksum");

ALTER TABLE "Repositories" ADD CONSTRAINT "fk_Repositories_callId" FOREIGN KEY("callId")
REFERENCES "Calls" ("id");


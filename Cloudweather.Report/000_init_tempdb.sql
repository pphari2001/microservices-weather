CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20221118233815_init') THEN
    CREATE TABLE weatherreport (
        "Id" uuid NOT NULL,
        "CreatedOn" timestamp with time zone NOT NULL,
        "AverageHighF" numeric NOT NULL,
        "AverageLowF" numeric NOT NULL,
        "RainfallTotalInches" numeric NOT NULL,
        "SnowfallTotalInches" numeric NOT NULL,
        "ZipCode" text NOT NULL,
        CONSTRAINT "PK_weatherreport" PRIMARY KEY ("Id")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20221118233815_init') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20221118233815_init', '7.0.0');
    END IF;
END $EF$;
COMMIT;


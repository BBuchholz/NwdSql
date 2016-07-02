-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE LocalConfig (
	LocalConfigId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	LocalConfigKey TEXT NOT NULL UNIQUE, 
	LocalConfigValue TEXT,
	LocalConfigCreatedAt TEXT NOT NULL,
	LocalConfigUpdatedAt TEXT NOT NULL,
	UNIQUE(LocalConfigKey, LocalConfigValue)
)

-- updated at trigger
CREATE TRIGGER SetLocalConfigUpdatedAt
AFTER UPDATE ON LocalConfig
BEGIN
UPDATE LocalConfig 
	SET LocalConfigUpdatedAt = CURRENT_TIMESTAMP
	WHERE LocalConfig.LocalConfigId = NEW.LocalConfigId;
END

-- created at & updated at trigger
CREATE TRIGGER SetLocalConfigCreatedAt 
AFTER INSERT ON LocalConfig
BEGIN
UPDATE LocalConfig 
	SET LocalConfigCreatedAt = CURRENT_TIMESTAMP, 
		   LocalConfigUpdatedAt = CURRENT_TIMESTAMP
	WHERE LocalConfig.LocalConfigId = NEW.LocalConfigId;
END
)
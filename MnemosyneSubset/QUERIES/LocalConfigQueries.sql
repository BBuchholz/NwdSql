-- LOCAL_CONFIG_GET_VALUE_FOR_KEY_X
SELECT LocalConfigValue 
FROM LocalConfig 
WHERE LocalConfigKey = ?;

-- MNEMOSYNE_V5_INSERT_LOCAL_CONFIG_KEY_VALUE_X_Y
INSERT OR IGNORE INTO LocalConfig
	(LocalConfigKey, LocalConfigValue)
VALUES
	(?, ?);

-- MNEMOSYNE_V5_UPDATE_LOCAL_CONFIG_VALUE_FOR_KEY_X_Y
UPDATE LocalConfig
SET LocalConfigValue = ?
WHERE LocalConfigKey = ?;
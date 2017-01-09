-- INSERT_INTO_MEDIA_ROOT
"INSERT OR IGNORE INTO " + NwdContract.TABLE_MEDIA_ROOT + " " 
+ "	(" + NwdContract.COLUMN_MEDIA_DEVICE_ID + ", " + NwdContract.COLUMN_MEDIA_ROOT_PATH + ") " 
+ "VALUES " 
+ "	(?, ?); " 

-- INSERT_INTO_MEDIA_DEVICE 
"INSERT OR IGNORE INTO " + NwdContract.TABLE_MEDIA_DEVICE + " " 
+ "	(" + NwdContract.COLUMN_MEDIA_DEVICE_DESCRIPTION + ") " 
+ "VALUES " 
+ "	(?); " 

-- SELECT_MEDIA_DEVICE_ID 
"SELECT " + NwdContract.COLUMN_MEDIA_DEVICE_ID + " " 
+ "FROM " + NwdContract.TABLE_MEDIA_DEVICE + " " 
+ "WHERE " + NwdContract.COLUMN_MEDIA_DEVICE_DESCRIPTION + " = ? ; "

-- SELECT_FROM_MEDIA_DEVICE
"SELECT " + NwdContract.COLUMN_MEDIA_DEVICE_ID + ", " 
		  + NwdContract.COLUMN_MEDIA_DEVICE_DESCRIPTION + " "
+ "FROM " + NwdContract.TABLE_MEDIA_DEVICE + "; "

-- SELECT_ROOT_ID_ROOT_PATH_FROM_MEDIA_ROOT_FOR_DEVICE_ID
"SELECT " + NwdContract.COLUMN_MEDIA_ROOT_ID + ", " 
		  + NwdContract.COLUMN_MEDIA_ROOT_PATH + " "
+ "FROM " + NwdContract.TABLE_MEDIA_ROOT + " " 
+ "WHERE " + NwdContract.COLUMN_MEDIA_DEVICE_ID + " = ? ; "

-- INSERT_MEDIA_PATH
"INSERT OR IGNORE INTO " + NwdContract.TABLE_MEDIA_PATH + " " + 
"	(" + NwdContract.COLUMN_MEDIA_PATH_VALUE + ") " + 
"VALUES " + 
"	(?); "  

-- INSERT_MEDIA_FILE_NAME 
"INSERT OR IGNORE INTO " + NwdContract.TABLE_MEDIA + " " + 
"	(" + NwdContract.COLUMN_MEDIA_FILE_NAME + ") " + 
"VALUES " + 
"	(?); " 

-- INSERT_MEDIA_DEVICE_PATH_FILENAME_DEVICEID_PATH_X_Y_Z 
"INSERT OR IGNORE INTO " + NwdContract.TABLE_MEDIA_DEVICE_PATH + " " + 
"	(" + NwdContract.COLUMN_MEDIA_ID + ", " + NwdContract.COLUMN_MEDIA_DEVICE_ID + ", " + NwdContract.COLUMN_MEDIA_PATH_ID + ") " + 
"VALUES " + 
"	( " + 
"		(SELECT m." + NwdContract.COLUMN_MEDIA_ID + " FROM " + NwdContract.TABLE_MEDIA + " m LEFT JOIN " + NwdContract.TABLE_MEDIA_DEVICE_PATH + " mdp ON m." + NwdContract.COLUMN_MEDIA_ID + " = mdp." + NwdContract.COLUMN_MEDIA_ID + " WHERE " + NwdContract.COLUMN_MEDIA_FILE_NAME + " = ? AND m." + NwdContract.COLUMN_MEDIA_HASH + " IS NULL AND mdp." + NwdContract.COLUMN_MEDIA_DEVICE_ID + " IS NULL LIMIT 1), " + 
"		?, " + 
"		(SELECT " + NwdContract.COLUMN_MEDIA_PATH_ID + " FROM " + NwdContract.TABLE_MEDIA_PATH + " WHERE " + NwdContract.COLUMN_MEDIA_PATH_VALUE + " = ? LIMIT 1) " + 
"	) " 

-- SELECT_PATH_FOR_DEVICE_ID_LIKE_ROOT_PATH_X_Y
"SELECT mp." + NwdContract.COLUMN_MEDIA_PATH_VALUE + "  " +
"FROM " + NwdContract.TABLE_MEDIA_PATH + " mp  " +
"JOIN " + NwdContract.TABLE_MEDIA_DEVICE_PATH + " mdp  " +
"ON mp." + NwdContract.COLUMN_MEDIA_PATH_ID + " = mdp." + NwdContract.COLUMN_MEDIA_PATH_ID + " " +
"WHERE mdp." + NwdContract.COLUMN_MEDIA_DEVICE_ID + " = ? " +
"AND mp." + NwdContract.COLUMN_MEDIA_PATH_VALUE + " LIKE ? || '%'; "


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

-- INSERT_PATH
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
"		(SELECT " + NwdContract.COLUMN_MEDIA_ID + " FROM " + NwdContract.TABLE_MEDIA + " WHERE " + NwdContract.COLUMN_MEDIA_FILE_NAME + " = ? AND " + NwdContract.COLUMN_MEDIA_HASH + " IS NULL LIMIT 1), " + 
"		?, " + 
"		(SELECT " + NwdContract.COLUMN_MEDIA_PATH_ID + " FROM " + NwdContract.TABLE_MEDIA_PATH + " WHERE " + NwdContract.COLUMN_MEDIA_PATH_VALUE + " = ? LIMIT 1) " + 
"	) " 
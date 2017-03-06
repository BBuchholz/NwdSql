-- INSERT_DEVICE_ID_PATH_INTO_MEDIA_ROOT
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

-- SELECT_ID_AND_PATH_FROM_MEDIA_ROOT_FOR_DEVICE_ID
"SELECT " + NwdContract.COLUMN_MEDIA_ROOT_ID + ", " 
		  + NwdContract.COLUMN_MEDIA_ROOT_PATH + " "
+ "FROM " + NwdContract.TABLE_MEDIA_ROOT + " " 
+ "WHERE " + NwdContract.COLUMN_MEDIA_DEVICE_ID + " = ? ; "

-- INSERT_MEDIA_PATH_X
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

-- INSERT_MEDIA_HASH_X 
"INSERT OR IGNORE INTO " + TABLE_MEDIA + " " +
"	(" + COLUMN_MEDIA_HASH + ") " +
"VALUES " +
"	(?); "

-- SELECT_MEDIA_ID_FOR_HASH_X
"SELECT " + COLUMN_MEDIA_ID + " " +
"FROM " + TABLE_MEDIA + " " +
"WHERE " + COLUMN_MEDIA_HASH + " = ?;" 

--UPDATE_HASH_FOR_MEDIA_ID_X_Y
"UPDATE " + TABLE_MEDIA + " " +
"SET " + COLUMN_MEDIA_HASH + " = ? " +
"WHERE " + COLUMN_MEDIA_ID + " = ? "

--INSERT_MEDIA_DEVICE_PATH_MID_DID_PID
"INSERT OR IGNORE INTO " + TABLE_MEDIA_DEVICE_PATH + " " +
"	(" + COLUMN_MEDIA_ID + ", " + COLUMN_MEDIA_DEVICE_ID + ", " + COLUMN_MEDIA_PATH_ID + ") " +
"VALUES " +
"	(?, ?, ?); "

-- SELECT_MEDIA_PATH_ID_FOR_PATH_X
"SELECT " + COLUMN_MEDIA_PATH_ID + " " +
"FROM " + TABLE_MEDIA_PATH + " " +
"WHERE " + COLUMN_MEDIA_PATH_VALUE + " = ?;"

-- SELECT_MEDIA_TAG_ID_VALUE
"SELECT " + COLUMN_MEDIA_TAG_ID + ", " + COLUMN_MEDIA_TAG_VALUE + " " +
"FROM " + TABLE_MEDIA_TAG + ";"

-- INSERT_MEDIA_TAG_X
"INSERT OR IGNORE INTO " + TABLE_MEDIA_TAG + " " +
"	(" + COLUMN_MEDIA_TAG_VALUE + ") " +
"VALUES " +
"	(?); " 

-- SELECT_MEDIA_TAG_ID_FOR_VALUE_X
"SELECT " + COLUMN_MEDIA_TAG_ID + "  " +
"FROM " + TABLE_MEDIA_TAG + " " +
"WHERE " + COLUMN_MEDIA_TAG_VALUE + " = ?; "

-- SELECT_MEDIA_WHERE_HASH_NOT_NULL_OR_WHITESPACE
"SELECT " + COLUMN_MEDIA_ID + ",  " +
"	   " + COLUMN_MEDIA_FILE_NAME + ",  " +
"	   " + COLUMN_MEDIA_DESCRIPTION + ",  " +
"	   " + COLUMN_MEDIA_HASH + " " +
"FROM " + TABLE_MEDIA + " " +
"WHERE " + COLUMN_MEDIA_HASH + " IS NOT NULL AND trim(" + COLUMN_MEDIA_HASH + ", ' ') != ''; "

-- INSERT_OR_IGNORE_MEDIA_TAGGING_X_Y
"INSERT OR IGNORE INTO " + TABLE_MEDIA_TAGGING + " " +
"	(" + COLUMN_MEDIA_ID + ", " + COLUMN_MEDIA_TAG_ID + ") " +
"VALUES " +
"	(?, ?); " 

-- SELECT_TAGS_FOR_HASH
"SELECT mt." + COLUMN_MEDIA_TAG_ID + ", " +
"	   mt." + COLUMN_MEDIA_TAG_VALUE + ", " +
"	   mtg." + COLUMN_MEDIA_TAGGING_ID + ", " +
"	   mtg." + COLUMN_MEDIA_ID + ", " +
"	   mtg." + COLUMN_MEDIA_TAGGING_TAGGED_AT + ", " +
"	   mtg." + COLUMN_MEDIA_TAGGING_UNTAGGED_AT + ", " +
"	   m." + COLUMN_MEDIA_HASH + " " +
"FROM " + TABLE_MEDIA_TAG + " mt " +
"JOIN " + TABLE_MEDIA_TAGGING + " mtg " +
"ON mt." + COLUMN_MEDIA_TAG_ID + " = mtg." + COLUMN_MEDIA_TAG_ID + " " +
"JOIN " + TABLE_MEDIA + " m " +
"ON m." + COLUMN_MEDIA_ID + " = mtg." + COLUMN_MEDIA_ID + " " +
"WHERE m." + COLUMN_MEDIA_HASH + " = ? " +
"AND (mtg." + COLUMN_MEDIA_TAGGING_UNTAGGED_AT + " IS NULL " +
"   OR mtg." + COLUMN_MEDIA_TAGGING_UNTAGGED_AT + " <= mtg." + COLUMN_MEDIA_TAGGING_TAGGED_AT + "); "

-- UPDATE_MEDIA_TAGGING_TAGGED_UNTAGGED_WHERE_MEDIA_ID_AND_TAG_ID_W_X_Y_Z
"UPDATE " + TABLE_MEDIA_TAGGING + " " +
"SET " + COLUMN_MEDIA_TAGGING_TAGGED_AT + " = MAX(IFNULL(" + COLUMN_MEDIA_TAGGING_TAGGED_AT + ", ''), ?), " +
"	" + COLUMN_MEDIA_TAGGING_UNTAGGED_AT + " = MAX(IFNULL(" + COLUMN_MEDIA_TAGGING_UNTAGGED_AT + ", ''), ?) " +
"WHERE " + COLUMN_MEDIA_ID + " = ? AND " + COLUMN_MEDIA_TAG_ID + " = ?; "

-- MNEMOSYNE_V5_SELECT_MEDIA_DEVICE_BY_DESC_X
"SELECT " + COLUMN_MEDIA_DEVICE_ID + ",  " +
"	    " + COLUMN_MEDIA_DEVICE_DESCRIPTION + " " +
"FROM " + TABLE_MEDIA_DEVICE + " " +
"WHERE " + COLUMN_MEDIA_DEVICE_DESCRIPTION + " = ?; " 

-- SELECT_DEVICE_PATHS_FOR_HASH_X
"SELECT mp." + COLUMN_MEDIA_PATH_VALUE + ", " + 
"       md." + COLUMN_MEDIA_DEVICE_DESCRIPTION + ", " + 
"       mdp." + COLUMN_MEDIA_DEVICE_PATH_ID + ", " + 
"       mdp." + COLUMN_MEDIA_ID + ", " + 
"       mdp." + COLUMN_MEDIA_DEVICE_ID + ", " + 
"       mdp." + COLUMN_MEDIA_PATH_ID + ", " + 
"       mdp." + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_PRESENT + ", " + 
"       mdp." + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_MISSING + " " + 
"FROM " + TABLE_MEDIA + " m " + 
"JOIN " + TABLE_MEDIA_DEVICE_PATH + " mdp " + 
"ON m." + COLUMN_MEDIA_ID + " = mdp." + COLUMN_MEDIA_ID + " " + 
"JOIN " + TABLE_MEDIA_DEVICE + " md " + 
"ON mdp." + COLUMN_MEDIA_DEVICE_ID + " = md." + COLUMN_MEDIA_DEVICE_ID + " " + 
"JOIN " + TABLE_MEDIA_PATH + " mp " + 
"ON mp." + COLUMN_MEDIA_PATH_ID + " = mdp." + COLUMN_MEDIA_PATH_ID + " " + 
"WHERE m." + COLUMN_MEDIA_HASH + " = ?; "

-- SELECT_MEDIA_FOR_HASH_X
"SELECT " + COLUMN_MEDIA_ID + ",  " +
"	    " + COLUMN_MEDIA_FILE_NAME + ",  " +
"	    " + COLUMN_MEDIA_DESCRIPTION + ",  " +
"	    " + COLUMN_MEDIA_HASH + " " +
"FROM " + TABLE_MEDIA + " " +
"WHERE " + COLUMN_MEDIA_HASH + " = ? "

--UPDATE_MEDIA_FILE_DESC_FOR_HASH_X_Y_Z
"UPDATE " + TABLE_MEDIA + "  " +
"SET " + COLUMN_MEDIA_FILE_NAME + " = ?, " +
"	 " + COLUMN_MEDIA_DESCRIPTION + " = ? " +
"WHERE " + COLUMN_MEDIA_HASH + " = ?  "

-- INSERT_MEDIA_DEVICE_PATH_V_W_X_Y_Z
"INSERT OR IGNORE INTO " + TABLE_MEDIA_DEVICE_PATH + " " +
"	( " +
"		" + COLUMN_MEDIA_ID + ", " +
"		" + COLUMN_MEDIA_DEVICE_ID + ",  " +
"		" + COLUMN_MEDIA_PATH_ID + ",  " +
"		" + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_PRESENT + ", " +
"		" + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_MISSING + " " +
"	) " +
"VALUES " +
"	(?, ?, ?, ?, ?);" 

-- UPDATE_MEDIA_DEVICE_PATH_V_W_X_Y_Z
"UPDATE " + TABLE_MEDIA_DEVICE_PATH + "  " +
"SET " + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_PRESENT + " = MAX(IFNULL(" + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_PRESENT + ", ''), ?), " +
"	" + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_MISSING + " = MAX(IFNULL(" + COLUMN_MEDIA_DEVICE_PATH_VERIFIED_MISSING + ", ''), ?) " +
"WHERE " + COLUMN_MEDIA_ID + " = ? AND " + COLUMN_MEDIA_DEVICE_ID + " = ? AND " + COLUMN_MEDIA_PATH_ID + " = ?; " 
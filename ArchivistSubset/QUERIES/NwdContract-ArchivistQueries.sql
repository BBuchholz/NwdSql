-- SELECT_TYPE_ID_TYPE_VALUE_FROM_SOURCE_TYPE
"SELECT " + NwdContract.COLUMN_SOURCE_TYPE_ID + ", " +
"	    " + NwdContract.COLUMN_SOURCE_TYPE_VALUE + " " +
"FROM " + NwdContract.TABLE_SOURCE_TYPE + "; "

-- SELECT_SOURCE_TYPE_ID_FOR_VALUE_X
"SELECT " + NwdContract.COLUMN_SOURCE_TYPE_ID + " " +
"FROM " + NwdContract.TABLE_SOURCE_TYPE + " " +
"WHERE " + NwdContract.COLUMN_SOURCE_TYPE_VALUE + " = ? ; " 

-- INSERT_OR_IGNORE_SOURCE_TYPE_VALUE
"INSERT OR IGNORE INTO " + NwdContract.TABLE_SOURCE_TYPE + " " +
"	(" + NwdContract.COLUMN_SOURCE_TYPE_VALUE + ") " +
"VALUES " +
"	(?); "

-- SELECT_SOURCES_BY_TYPE_ID_X
"SELECT " + COLUMN_SOURCE_ID + ", " + 
"	   " + COLUMN_SOURCE_TYPE_ID + ", " + 
"	   " + COLUMN_SOURCE_TITLE + ", " + 
"	   " + COLUMN_SOURCE_AUTHOR + ", " + 
"	   " + COLUMN_SOURCE_DIRECTOR + ", " + 
"	   " + COLUMN_SOURCE_YEAR + ", " + 
"	   " + COLUMN_SOURCE_URL + ", " + 
"	   " + COLUMN_SOURCE_RETRIEVAL_DATE + "  " + 
"FROM " + TABLE_SOURCE + " " +
"WHERE " + COLUMN_SOURCE_TYPE_ID + " = ?; "

-- SELECT_SOURCE_ID_W_X_Y_Z
"SELECT " + NwdContract.COLUMN_SOURCE_ID + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_TYPE_ID + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_TITLE + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_AUTHOR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_DIRECTOR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_YEAR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_URL + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_RETRIEVAL_DATE + "  " +
"FROM " + TABLE_SOURCE + " " +
"WHERE " + COLUMN_SOURCE_TYPE_ID + " = ?  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_TITLE + ", '')) = TRIM(IFNULL(?, ''))  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_YEAR + ", '')) = TRIM(IFNULL(?, ''))  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_URL + ", '')) = TRIM(IFNULL(?, '')); " 

-- INSERT_SOURCE_T_U_V_W_X_Y_Z
"INSERT OR IGNORE INTO " + TABLE_SOURCE + " " +
"	(" + COLUMN_SOURCE_TYPE_ID + ", " +
"	 " + COLUMN_SOURCE_TITLE + ", " +
"	 " + COLUMN_SOURCE_AUTHOR + ", " +
"	 " + COLUMN_SOURCE_DIRECTOR + ", " +
"	 " + COLUMN_SOURCE_YEAR + ", " +
"	 " + COLUMN_SOURCE_URL + ", " +
"	 " + COLUMN_SOURCE_RETRIEVAL_DATE + ") " +
"VALUES " +
"	(?,?,?,?,?,?,?); "
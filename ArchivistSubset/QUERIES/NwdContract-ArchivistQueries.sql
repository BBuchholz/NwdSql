-- SELECT_TYPE_ID_TYPE_VALUE_FROM_SOURCE_TYPE
"SELECT " + NwdContract.COLUMN_SOURCE_TYPE_ID + ", " +
"	    " + NwdContract.COLUMN_SOURCE_TYPE_VALUE + " " +
"FROM " + NwdContract.TABLE_SOURCE_TYPE + "; "

-- SELECT_SOURCE_TYPE_ID_FOR_VALUE_X
"SELECT " + NwdContract.COLUMN_SOURCE_TYPE_ID + " " +
"FROM " + NwdContract.TABLE_SOURCE_TYPE + " " +
"WHERE " + NwdContract.COLUMN_SOURCE_TYPE_VALUE + " = ? ; " 

-- SELECT_SOURCE_EXCERPT_TYPE_ID_X_Y
"SELECT " + COLUMN_SOURCE_EXCERPT_ID + " " +
"FROM " + TABLE_SOURCE_EXCERPT + " " +
"WHERE " + COLUMN_SOURCE_ID + " = ? " +
"AND " + COLUMN_SOURCE_EXCERPT_VALUE + " = ? ; "

-- INSERT_OR_IGNORE_SOURCE_TYPE_VALUE
"INSERT OR IGNORE INTO " + NwdContract.TABLE_SOURCE_TYPE + " " +
"	(" + NwdContract.COLUMN_SOURCE_TYPE_VALUE + ") " +
"VALUES " +
"	(?); "

-- INSERT_OR_IGNORE_SOURCE_TYPE_VALUE
"INSERT OR IGNORE INTO " + TABLE_SOURCE_EXCERPT + " " + 
"	(" + COLUMN_SOURCE_ID + ", " + COLUMN_SOURCE_EXCERPT_VALUE + ") " + 
"VALUES " + 
"	(?, ?);"

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

-- SELECT_SOURCE_W_X_Y_Z
"SELECT " + NwdContract.COLUMN_SOURCE_ID + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_TYPE_ID + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_TITLE + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_AUTHOR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_DIRECTOR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_YEAR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_URL + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_RETRIEVAL_DATE + ",  " +
"	    " + NwdContract.COLUMN_SOURCE_TAG + "  " +
"FROM " + TABLE_SOURCE + " " +
"WHERE " + COLUMN_SOURCE_TYPE_ID + " = ?  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_TITLE + ", '')) = TRIM(IFNULL(?, ''))  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_YEAR + ", '')) = TRIM(IFNULL(?, ''))  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_URL + ", '')) = TRIM(IFNULL(?, '')); " 

-- SELECT_SOURCE_BY_ID
"SELECT " + NwdContract.COLUMN_SOURCE_ID + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_TYPE_ID + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_TITLE + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_AUTHOR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_DIRECTOR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_YEAR + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_URL + ", " + 
"	    " + NwdContract.COLUMN_SOURCE_RETRIEVAL_DATE + ",  " +
"	    " + NwdContract.COLUMN_SOURCE_TAG + "  " +
"FROM " + TABLE_SOURCE + " " +
"WHERE " + COLUMN_SOURCE_ID + " = ? ; " 

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

-- SELECT_EXCERPTS_WITH_TAGS_FOR_SOURCE_ID_X
"SELECT  sext." + COLUMN_SOURCE_EXCERPT_TAGGING_ID + ", " +
"		se." + COLUMN_SOURCE_EXCERPT_ID + ", " +
"		se." + COLUMN_SOURCE_ID + ", " +
"		se." + COLUMN_SOURCE_EXCERPT_VALUE + ", " +
"		mt." + COLUMN_MEDIA_TAG_ID + ", " +
"		mt." + COLUMN_MEDIA_TAG_VALUE + " " +
"FROM " + TABLE_SOURCE_EXCERPT + " se " +
"LEFT JOIN " + TABLE_SOURCE_EXCERPT_TAGGING + " sext " +
"ON se." + COLUMN_SOURCE_EXCERPT_ID + " = sext." + COLUMN_SOURCE_EXCERPT_ID + " " +
"LEFT JOIN " + TABLE_MEDIA_TAG + " mt " +
"ON sext." + COLUMN_MEDIA_TAG_ID + " = mt." + COLUMN_MEDIA_TAG_ID + " " +
"WHERE se." + COLUMN_SOURCE_ID + " = ? ; " 

-- SELECT_EXCERPTS_WITH_TAGGED_TAGS_FOR_SOURCE_ID_X
"SELECT  sext." + COLUMN_SOURCE_EXCERPT_TAGGING_ID + ", " +
"		se." + COLUMN_SOURCE_EXCERPT_ID + ", " +
"		se." + COLUMN_SOURCE_ID + ", " +
"		se." + COLUMN_SOURCE_EXCERPT_VALUE + ", " +
"		mt." + COLUMN_MEDIA_TAG_ID + ", " +
"		mt." + COLUMN_MEDIA_TAG_VALUE + " " +
"FROM " + TABLE_SOURCE_EXCERPT + " se " +
"LEFT JOIN " + TABLE_SOURCE_EXCERPT_TAGGING + " sext " +
"ON se." + COLUMN_SOURCE_EXCERPT_ID + " = sext." + COLUMN_SOURCE_EXCERPT_ID + " " +
"LEFT JOIN " + TABLE_MEDIA_TAG + " mt " +
"ON sext." + COLUMN_MEDIA_TAG_ID + " = mt." + COLUMN_MEDIA_TAG_ID + " " +
"WHERE se." + COLUMN_SOURCE_ID + " = ? " +
"AND IFNULL(sext." + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + ", '') >= IFNULL(sext." + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + ", ''); "

-- UPDATE_SOURCE_EXCERPT_TAGGING_TIMESTAMPS_X_Y_Z
"UPDATE " + TABLE_SOURCE_EXCERPT_TAGGING + "  " + 
"SET " + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + "  =  MAX(IFNULL(" + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + ", ''), ?), " + 
"	 " + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + " = MAX(IFNULL(" + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + ", ''), ?) " + 
"WHERE " + COLUMN_SOURCE_EXCERPT_TAGGING_ID + " = ? ; " 

-- UPDATE_SOURCE_TAG_WHERE_SOURCE_ID
"UPDATE " + TABLE_SOURCE + " " +
"SET " + COLUMN_SOURCE_TAG + " = ?  " +
"WHERE " + COLUMN_SOURCE_ID + " = ? ;  "

-- SELECT_SOURCE_EXCERPT_TAGGING_ID_X_Y
"SELECT " + COLUMN_SOURCE_EXCERPT_TAGGING_ID + " " + 
"FROM " + TABLE_SOURCE_EXCERPT_TAGGING + " " + 
"WHERE " + COLUMN_SOURCE_EXCERPT_ID + " = ?  " + 
"AND " + COLUMN_MEDIA_TAG_ID + " = ? ; "  

-- INSERT_OR_IGNORE_EXCERPT_TAGGING_X_Y
"INSERT OR IGNORE INTO " + TABLE_SOURCE_EXCERPT_TAGGING + " " +
"	(" + COLUMN_SOURCE_EXCERPT_ID + ", " + COLUMN_MEDIA_TAG_ID + ") " +
"VALUES " +
"	(?, ?); "

-- SELECT_EXCERPTS_WITH_SOURCE_FOR_TAG_ID_X
"SELECT sext." + COLUMN_SOURCE_EXCERPT_TAGGING_ID + ", " + 
"		se." + COLUMN_SOURCE_EXCERPT_ID + ", " + 
"		se." + COLUMN_SOURCE_EXCERPT_VALUE + ", " + 
"		mt." + COLUMN_MEDIA_TAG_ID + ", " + 
"		mt." + COLUMN_MEDIA_TAG_VALUE + ", " + 
"		s." + COLUMN_SOURCE_ID + ", " + 
"		s." + COLUMN_SOURCE_AUTHOR + ", " + 
"		s." + COLUMN_SOURCE_TITLE + ", " + 
"		s." + COLUMN_SOURCE_URL + ", " + 
"		st." + COLUMN_SOURCE_TYPE_VALUE + " " + 
"FROM " + TABLE_SOURCE_EXCERPT + " se  " + 
"JOIN " + TABLE_SOURCE + " s " + 
"ON se." + COLUMN_SOURCE_ID + " = s." + COLUMN_SOURCE_ID + " " + 
"JOIN " + TABLE_SOURCE_TYPE + " st " + 
"ON s." + COLUMN_SOURCE_TYPE_ID + " = st." + COLUMN_SOURCE_TYPE_ID + " " + 
"LEFT JOIN " + TABLE_SOURCE_EXCERPT_TAGGING + " sext " + 
"ON se." + COLUMN_SOURCE_EXCERPT_ID + " = sext." + COLUMN_SOURCE_EXCERPT_ID + " " + 
"LEFT JOIN " + TABLE_MEDIA_TAG + " mt " + 
"ON sext." + COLUMN_MEDIA_TAG_ID + " = mt." + COLUMN_MEDIA_TAG_ID + " " + 
"WHERE sext." + COLUMN_SOURCE_EXCERPT_ID + " IN (SELECT " + COLUMN_SOURCE_EXCERPT_ID + " FROM " + TABLE_SOURCE_EXCERPT_TAGGING + " WHERE " + COLUMN_MEDIA_TAG_ID + " = ? ) " + 
"AND IFNULL(sext." + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + ", '') >= IFNULL(sext." + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + ", ''); "

-- SELECT_SOURCE_EXCERPT_BY_ID
"SELECT " + COLUMN_SOURCE_EXCERPT_ID + ", " +
"	    " + COLUMN_SOURCE_ID + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_VALUE + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_PAGES + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_BEGIN_TIME + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_END_TIME + " " +
"FROM " + TABLE_SOURCE_EXCERPT + "  " +
"WHERE " + COLUMN_SOURCE_EXCERPT_ID + " = ? ; "

-- SELECT_SOURCE_EXCERPT_ANNOTATIONS_BY_SOURCE_EXCERPT_ID
"SELECT sea." + COLUMN_SOURCE_EXCERPT_ANNOTATION_ID + ",  " +
"	    sea." + COLUMN_SOURCE_EXCERPT_ID + ",  " +
"	    sa." + COLUMN_SOURCE_ANNOTATION_ID + ",  " +
"	    sa." + COLUMN_SOURCE_ANNOTATION_VALUE + "  " +
"FROM " + TABLE_SOURCE_EXCERPT_ANNOTATION + " sea  " +
"JOIN " + TABLE_SOURCE_ANNOTATION + " sa  " +
"ON sea." + COLUMN_SOURCE_ANNOTATION_ID + " = sa." + COLUMN_SOURCE_ANNOTATION_ID + " " +
"WHERE sea." + COLUMN_SOURCE_EXCERPT_ID + " = ? ; " 

-- SELECT_SOURCE_ANNOTATION_ID_FOR_ANNOTATION_VALUE
"SELECT " + COLUMN_SOURCE_ANNOTATION_ID + " " +
"FROM " + TABLE_SOURCE_ANNOTATION + " " +
"WHERE " + COLUMN_SOURCE_ANNOTATION_VALUE + " = ? ; "

-- INSERT_OR_IGNORE_SOURCE_ANNOTATION_VALUE
"INSERT OR IGNORE INTO " + TABLE_SOURCE_ANNOTATION + " " + 
"	(" + COLUMN_SOURCE_ANNOTATION_VALUE + ") " + 
"VALUES " + 
"	(?) ; " 

-- INSERT_OR_IGNORE_SOURCE_EXCERPT_ANNOTATION_EXCERPT_ID_ANNOTATION_ID_X_Y
"INSERT OR IGNORE INTO " + TABLE_SOURCE_EXCERPT_ANNOTATION + " " + 
"	(" + COLUMN_SOURCE_EXCERPT_ID + ", " + 
"	 " + COLUMN_SOURCE_ANNOTATION_ID + ") " + 
"VALUES " + 
"	(?,?) ; " 






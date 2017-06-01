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

-- UPDATE_SOURCE_EXCERPT_TAGGING_TIMESTAMPS_X_Y_Z
UPDATE SourceExcerptTagging 
SET SourceExcerptTaggingTaggedAt = MAX(IFNULL(SourceExcerptTaggingTaggedAt, ''), ?),
	SourceExcerptTaggingUntaggedAt = MAX(IFNULL(SourceExcerptTaggingUntaggedAt, ''), ?)
WHERE SourceExcerptTaggingId = ? ;

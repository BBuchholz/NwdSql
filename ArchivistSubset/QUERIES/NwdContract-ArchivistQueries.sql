-- SELECT_TYPE_ID_TYPE_VALUE_FROM_SOURCE_TYPE
"SELECT " + NwdContract.COLUMN_SOURCE_TYPE_ID + ", " +
"	    " + NwdContract.COLUMN_SOURCE_TYPE_VALUE + " " +
"FROM " + NwdContract.TABLE_SOURCE_TYPE + "; "

-- SELECT_SOURCE_TYPE_ID_FOR_VALUE_X
"SELECT " + NwdContract.COLUMN_SOURCE_TYPE_ID + " " +
"FROM " + NwdContract.TABLE_SOURCE_TYPE + " " +
"WHERE " + NwdContract.COLUMN_SOURCE_TYPE_VALUE + " = ? ; " 

-- SELECT_SOURCE_EXCERPT_ID_X_Y
"SELECT " + COLUMN_SOURCE_EXCERPT_ID + " " +
"FROM " + TABLE_SOURCE_EXCERPT + " " +
"WHERE " + COLUMN_SOURCE_ID + " = ? " +
"AND " + COLUMN_SOURCE_EXCERPT_VALUE + " = ? ; "

-- SELECT_SOURCE_EXCERPT_ID_FOR_SRCID_EXVAL_BTIME_ETIME_PGS_V_W_X_Y_Z
"SELECT " + COLUMN_SOURCE_EXCERPT_ID + " " +
"FROM " + TABLE_SOURCE_EXCERPT + " " +
"WHERE " + COLUMN_SOURCE_ID + " = ? " +
"AND " + COLUMN_SOURCE_EXCERPT_VALUE + " = ?  " +
"AND " + COLUMN_SOURCE_EXCERPT_BEGIN_TIME + " = ? " +
"AND " + COLUMN_SOURCE_EXCERPT_END_TIME + " = ? " +
"AND " + COLUMN_SOURCE_EXCERPT_PAGES + " = ? ; " 

-- INSERT_OR_IGNORE_SOURCE_TYPE_VALUE
"INSERT OR IGNORE INTO " + NwdContract.TABLE_SOURCE_TYPE + " " +
"	(" + NwdContract.COLUMN_SOURCE_TYPE_VALUE + ") " +
"VALUES " +
"	(?); "

-- INSERT_OR_IGNORE_SOURCE_EXCERPT_X_Y
"INSERT OR IGNORE INTO " + TABLE_SOURCE_EXCERPT + " " + 
"	(" + COLUMN_SOURCE_ID + ", " + COLUMN_SOURCE_EXCERPT_VALUE + ") " + 
"VALUES " + 
"	(?, ?);"

-- INSERT_OR_IGNORE_SOURCE_EXCERPT_SRCID_EXVAL_BTIME_ETIME_PGS_V_W_X_Y_Z 
"INSERT OR IGNORE INTO " + TABLE_SOURCE_EXCERPT + " " + 
"	(" + COLUMN_SOURCE_ID + ", " + COLUMN_SOURCE_EXCERPT_VALUE + ", " + COLUMN_SOURCE_EXCERPT_BEGIN_TIME + ", " + COLUMN_SOURCE_EXCERPT_END_TIME + ", " + COLUMN_SOURCE_EXCERPT_PAGES + ") " + 
"VALUES  " + 
"	(?, ?, ?, ?, ?); " 

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

-- SELECT_SOURCES 
"SELECT " + COLUMN_SOURCE_ID + ", " +
"	   " + COLUMN_SOURCE_TYPE_ID + ", " +
"	   " + COLUMN_SOURCE_TITLE + ", " +
"	   " + COLUMN_SOURCE_AUTHOR + ", " +
"	   " + COLUMN_SOURCE_DIRECTOR + ", " +
"	   " + COLUMN_SOURCE_YEAR + ", " +
"	   " + COLUMN_SOURCE_URL + ", " +
"	   " + COLUMN_SOURCE_RETRIEVAL_DATE + ",  " +
"	   " + COLUMN_SOURCE_TAG + "  " +
"FROM " + TABLE_SOURCE + " ; ";

-- SELECT_SOURCE_W_X_Y_Z
"SELECT " + COLUMN_SOURCE_ID + ", " + 
"	    " + COLUMN_SOURCE_TYPE_ID + ", " + 
"	    " + COLUMN_SOURCE_TITLE + ", " + 
"	    " + COLUMN_SOURCE_AUTHOR + ", " + 
"	    " + COLUMN_SOURCE_DIRECTOR + ", " + 
"	    " + COLUMN_SOURCE_YEAR + ", " + 
"	    " + COLUMN_SOURCE_URL + ", " + 
"	    " + COLUMN_SOURCE_RETRIEVAL_DATE + ",  " +
"	    " + COLUMN_SOURCE_TAG + "  " +
"FROM " + TABLE_SOURCE + " " +
"WHERE " + COLUMN_SOURCE_TYPE_ID + " = ?  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_TITLE + ", '')) = TRIM(IFNULL(?, ''))  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_YEAR + ", '')) = TRIM(IFNULL(?, ''))  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_URL + ", '')) = TRIM(IFNULL(?, '')); " 


-- SELECT_SOURCE_FOR_TID_TTL_AUT_DIR_YR_URL_RDT_TG
"SELECT " + COLUMN_SOURCE_ID + ", " +
"       " + COLUMN_SOURCE_TYPE_ID + ", " +
"       " + COLUMN_SOURCE_TITLE + ", " +
"       " + COLUMN_SOURCE_AUTHOR + ", " +
"       " + COLUMN_SOURCE_DIRECTOR + ", " +
"       " + COLUMN_SOURCE_YEAR + ", " +
"       " + COLUMN_SOURCE_URL + ", " +
"       " + COLUMN_SOURCE_RETRIEVAL_DATE + ", " +
"       " + COLUMN_SOURCE_TAG + " " +
"FROM " + TABLE_SOURCE + "  " +
"WHERE " + COLUMN_SOURCE_TYPE_ID + " = ?  " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_TITLE + ", '')) = TRIM(IFNULL(?, '')) " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_AUTHOR + ", '')) = TRIM(IFNULL(?, '')) " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_DIRECTOR + ", '')) = TRIM(IFNULL(?, '')) " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_YEAR + ", '')) = TRIM(IFNULL(?, '')) " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_URL + ", '')) = TRIM(IFNULL(?, '')) " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_RETRIEVAL_DATE + ", '')) = TRIM(IFNULL(?, '')) " +
"AND TRIM(IFNULL(" + COLUMN_SOURCE_TAG + ", '')) = TRIM(IFNULL(?, '')); "

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

-- INSERT_SOURCE_TID_TTL_AUT_DIR_YR_URL_RDT_TG
"INSERT OR IGNORE INTO " + TABLE_SOURCE + " " +
"	(" + COLUMN_SOURCE_TYPE_ID + ", " +
"	 " + COLUMN_SOURCE_TITLE + ", " +
"	 " + COLUMN_SOURCE_AUTHOR + ", " +
"	 " + COLUMN_SOURCE_DIRECTOR + ", " +
"	 " + COLUMN_SOURCE_YEAR + ", " +
"	 " + COLUMN_SOURCE_URL + ", " +
"	 " + COLUMN_SOURCE_RETRIEVAL_DATE + ", " +
"	 " + COLUMN_SOURCE_TAG + ") " +
"VALUES " +
"	(?,?,?,?,?,?,?,?); "

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

-- SELECT_LOCATION_ID_LOCATION_VALUE_FROM_SOURCE_LOCATION
"SELECT " + COLUMN_SOURCE_LOCATION_ID + ", " +
"	    " + COLUMN_SOURCE_LOCATION_VALUE + " " +
"FROM " + TABLE_SOURCE_LOCATION + "; "

-- SELECT_SOURCE_LOCATION_ID_FOR_VALUE_X
"SELECT " + COLUMN_SOURCE_LOCATION_ID + " " +
"FROM " + TABLE_SOURCE_LOCATION + " " +
"WHERE " + COLUMN_SOURCE_LOCATION_VALUE + " = ? ; " 

-- INSERT_OR_IGNORE_SOURCE_LOCATION_VALUE
"INSERT OR IGNORE INTO " + TABLE_SOURCE_LOCATION + " " +
"	(" + COLUMN_SOURCE_LOCATION_VALUE + ") " +
"VALUES " +
"	(?); "

-- SELECT_SOURCE_LOCATION_SUBSETS_BY_LOCATION_ID_X
"SELECT " + COLUMN_SOURCE_LOCATION_SUBSET_ID + ", " + 
"	   " + COLUMN_SOURCE_LOCATION_ID + ", " + 
"	   " + COLUMN_SOURCE_LOCATION_SUBSET_VALUE + " " + 
"FROM " + TABLE_SOURCE_LOCATION_SUBSET + " " + 
"WHERE " + COLUMN_SOURCE_LOCATION_ID + " = ? ; " 

-- SELECT_SOURCE_LOCATION_SUBSET_ID_FOR_LOCATION_ID_AND_SUBSET_VALUE_X_Y
"SELECT " + COLUMN_SOURCE_LOCATION_SUBSET_ID + " " + 
"FROM " + TABLE_SOURCE_LOCATION_SUBSET + " " + 
"WHERE " + COLUMN_SOURCE_LOCATION_ID + " = ?  " + 
"AND " + COLUMN_SOURCE_LOCATION_SUBSET_VALUE + " = ? ; " 

-- INSERT_OR_IGNORE_SOURCE_LOCATION_SUBSET_FOR_LOCATION_ID_AND_SUBSET_VALUE_X_Y
"INSERT OR IGNORE INTO " + TABLE_SOURCE_LOCATION_SUBSET + "  " + 
"	(" + COLUMN_SOURCE_LOCATION_ID + ",  " + 
"	 " + COLUMN_SOURCE_LOCATION_SUBSET_VALUE + ") " + 
"VALUES  " + 
"	(?,?); " 

-- SELECT_SOURCE_LOCATION_SUBSET_ENTRIES_FOR_SOURCE_ID_X
"SELECT slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_ID + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ID + ", " +
"	   sl." + COLUMN_SOURCE_LOCATION_VALUE + ", " +
"	   sls." + COLUMN_SOURCE_LOCATION_SUBSET_VALUE + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VALUE + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_PRESENT_AT + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_MISSING_AT + "	    " +
"FROM " + TABLE_SOURCE_LOCATION + " sl " +
"JOIN " + TABLE_SOURCE_LOCATION_SUBSET + " sls " +
"ON sl." + COLUMN_SOURCE_LOCATION_ID + " = sls." + COLUMN_SOURCE_LOCATION_ID + " " +
"JOIN " + TABLE_SOURCE_LOCATION_SUBSET_ENTRY + " slse " +
"ON sls." + COLUMN_SOURCE_LOCATION_SUBSET_ID + " = slse." + COLUMN_SOURCE_LOCATION_SUBSET_ID + " " +
"WHERE slse." + COLUMN_SOURCE_ID + " = ? ; " 

-- SELECT_VERIFIED_PRESENT_SOURCE_LOCATION_SUBSET_ENTRIES_FOR_SOURCE_ID_X
"SELECT slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_ID + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ID + ", " +
"	   sl." + COLUMN_SOURCE_LOCATION_VALUE + ", " +
"	   sls." + COLUMN_SOURCE_LOCATION_SUBSET_VALUE + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VALUE + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_PRESENT_AT + ", " +
"	   slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_MISSING_AT + "	    " +
"FROM " + TABLE_SOURCE_LOCATION + " sl " +
"JOIN " + TABLE_SOURCE_LOCATION_SUBSET + " sls " +
"ON sl." + COLUMN_SOURCE_LOCATION_ID + " = sls." + COLUMN_SOURCE_LOCATION_ID + " " +
"JOIN " + TABLE_SOURCE_LOCATION_SUBSET_ENTRY + " slse " +
"ON sls." + COLUMN_SOURCE_LOCATION_SUBSET_ID + " = slse." + COLUMN_SOURCE_LOCATION_SUBSET_ID + " " +
"WHERE slse." + COLUMN_SOURCE_ID + " = ? " + 
"AND slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_PRESENT_AT + " >= slse." + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_MISSING_AT + " ; "

-- INSERT_OR_IGNORE_INTO_SOURCE_LOCATION_SUBSET_ENTRY_VALUES_SUBSET_ID_SOURCE_ID_ENTRY_VALUE_X_Y_Z
"INSERT OR IGNORE INTO " + TABLE_SOURCE_LOCATION_SUBSET_ENTRY + " " + 
"	(" + COLUMN_SOURCE_LOCATION_SUBSET_ID + ", " + 
"	 " + COLUMN_SOURCE_ID + ", " + 
"	 " + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VALUE + ") " + 
" VALUES (?,?,?); " 

-- SELECT_SOURCE_LOCATION_SUBSET_ENTRY_ID_FOR_SUBSET_ID_AND_SOURCE_ID_AND_ENTRY_VALUE_X_Y_Z
"SELECT " + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_ID + " " + 
"FROM " + TABLE_SOURCE_LOCATION_SUBSET_ENTRY + " " + 
"WHERE " + COLUMN_SOURCE_LOCATION_SUBSET_ID + " = ? " + 
"AND " + COLUMN_SOURCE_ID + " = ? " +
"AND " + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VALUE + " = ?; " 

-- UPDATE_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_PRESENT_VERIFIED_MISSING_FOR_ID_X_Y_Z
"UPDATE " + TABLE_SOURCE_LOCATION_SUBSET_ENTRY + "  " + 
"SET " + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_PRESENT_AT + " = MAX(IFNULL(" + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_PRESENT_AT + ", ''), ?), " + 
"	" + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_MISSING_AT + " = MAX(IFNULL(" + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_VERIFIED_MISSING_AT + ", ''), ?) " + 
"WHERE " + COLUMN_SOURCE_LOCATION_SUBSET_ENTRY_ID + " = ? ; " 

-- SELECT_SOURCE_EXCERPT_TAGGING_WRAPPER_VALS_FOR_EXCERPT_ID_X
"SELECT mt." + COLUMN_MEDIA_TAG_VALUE + ", " + 
"	   setag." + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + ", " + 
"	   setag." + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + " " + 
"FROM " + TABLE_SOURCE_EXCERPT_TAGGING + " setag " + 
"JOIN " + TABLE_MEDIA_TAG + " mt " + 
"ON setag." + COLUMN_MEDIA_TAG_ID + " = mt." + COLUMN_MEDIA_TAG_ID + " " + 
"WHERE setag." + COLUMN_SOURCE_EXCERPT_ID + " = ? ; " 

-- SELECT_SOURCE_EXCERPTS_FOR_SOURCE_ID_X
"SELECT " + COLUMN_SOURCE_EXCERPT_ID + ", " +
"	    " + COLUMN_SOURCE_ID + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_VALUE + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_PAGES + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_BEGIN_TIME + ", " +
"	    " + COLUMN_SOURCE_EXCERPT_END_TIME + " " +
"FROM " + TABLE_SOURCE_EXCERPT + "  " +
"WHERE " + COLUMN_SOURCE_ID + " = ? ; "

-- UPDATE_EXCERPT_TAGGING_TAGGED_UNTAGGED_WHERE_EXID_AND_TGID_W_X_Y_Z
"UPDATE " + TABLE_SOURCE_EXCERPT_TAGGING + "  " + 
"SET " + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + " = MAX(IFNULL(" + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + ", ''), ?), " + 
"	" + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + " = MAX(IFNULL(" + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + ", ''), ?) " + 
"WHERE " + COLUMN_SOURCE_EXCERPT_ID + " = ?  " + 
"AND " + COLUMN_MEDIA_TAG_ID + " = ? ; "

-- SELECT_ARCHIVIST_SOURCE_EXCERPT_TAGGINGS_FOR_EXID
"SELECT mt." + COLUMN_MEDIA_TAG_ID + ", " + 
"	   sext." + COLUMN_SOURCE_EXCERPT_TAGGING_ID + ", " + 
"	   sext." + COLUMN_SOURCE_EXCERPT_ID + ", " + 
"	   mt." + COLUMN_MEDIA_TAG_VALUE + ", " + 
"	   sext." + COLUMN_SOURCE_EXCERPT_TAGGING_TAGGED_AT + ", " + 
"	   sext." + COLUMN_SOURCE_EXCERPT_TAGGING_UNTAGGED_AT + " " + 
"FROM " + TABLE_SOURCE_EXCERPT_TAGGING + " sext " + 
"JOIN " + TABLE_MEDIA_TAG + " mt  " + 
"ON sext." + COLUMN_MEDIA_TAG_ID + " = mt." + COLUMN_MEDIA_TAG_ID + " " +
"WHERE sext." + COLUMN_SOURCE_EXCERPT_ID + " = ?; "



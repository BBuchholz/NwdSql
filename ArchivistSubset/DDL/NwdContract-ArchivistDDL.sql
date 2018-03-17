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

-- SELECT_LOCATION_ID_LOCATION_VALUE_FROM_SOURCE_TYPE
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


(above is copied just so SublimeText can use its autocomplete, remove after done)
------------------------------------------------------------------------------------------------------------------------------



-- CREATE_SOURCE_LOCATION
"CREATE TABLE SourceLocation ( " +
"	SourceLocationId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	SourceLocationValue TEXT NOT NULL UNIQUE, " +
"	SourceLocationCreatedAt TEXT, " +
"	SourceLocationUpdatedAt TEXT " +
") " 

-- CREATE_SOURCE_LOCATION_CREATED_TRIGGER
"CREATE TRIGGER SetSourceLocationCreatedAt  " +
"AFTER INSERT ON SourceLocation " +
"BEGIN " +
"UPDATE SourceLocation  " +
"	SET SourceLocationCreatedAt = CURRENT_TIMESTAMP,  " +
"		   SourceLocationUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceLocation.SourceLocationId = NEW.SourceLocationId; " +
"END " 

-- CREATE_SOURCE_LOCATION_UPDATED_TRIGGER
"CREATE TRIGGER SetSourceLocationUpdatedAt " +
"AFTER UPDATE ON SourceLocation " +
"BEGIN " +
"UPDATE SourceLocation  " +
"	SET SourceLocationUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceLocation.SourceLocationId = NEW.SourceLocationId; " +
"END " 







-- CREATE_SOURCE_ANNOTATION
"CREATE TABLE SourceAnnotation ( " +
"	SourceAnnotationId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	SourceAnnotationValue TEXT NOT NULL UNIQUE, " +
"	SourceAnnotationCreatedAt TEXT, " +
"	SourceAnnotationUpdatedAt TEXT " +
") " 

-- CREATE_SOURCE_ANNOTATION_CREATED_TRIGGER
"CREATE TRIGGER SetSourceAnnotationCreatedAt  " +
"AFTER INSERT ON SourceAnnotation " +
"BEGIN " +
"UPDATE SourceAnnotation  " +
"	SET SourceAnnotationCreatedAt = CURRENT_TIMESTAMP,  " +
"		   SourceAnnotationUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceAnnotation.SourceAnnotationId = NEW.SourceAnnotationId; " +
"END " 

-- CREATE_SOURCE_ANNOTATION_UPDATED_TRIGGER
"CREATE TRIGGER SetSourceAnnotationUpdatedAt " +
"AFTER UPDATE ON SourceAnnotation " +
"BEGIN " +
"UPDATE SourceAnnotation  " +
"	SET SourceAnnotationUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceAnnotation.SourceAnnotationId = NEW.SourceAnnotationId; " +
"END " 






-- CREATE_SOURCE_TYPE
"CREATE TABLE SourceType ( " +
"	SourceTypeId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	SourceTypeValue TEXT NOT NULL UNIQUE, " +
"	SourceTypeCreatedAt TEXT, " +
"	SourceTypeUpdatedAt TEXT " +
") " 

-- CREATE_SOURCE_TYPE_CREATED_TRIGGER
"CREATE TRIGGER SetSourceTypeCreatedAt  " +
"AFTER INSERT ON SourceType " +
"BEGIN " +
"UPDATE SourceType  " +
"	SET SourceTypeCreatedAt = CURRENT_TIMESTAMP,  " +
"		   SourceTypeUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceType.SourceTypeId = NEW.SourceTypeId; " +
"END " 

-- CREATE_SOURCE_TYPE_UPDATED_TRIGGER
"CREATE TRIGGER SetSourceTypeUpdatedAt " +
"AFTER UPDATE ON SourceType " +
"BEGIN " +
"UPDATE SourceType  " +
"	SET SourceTypeUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceType.SourceTypeId = NEW.SourceTypeId; " +
"END " 






-- CREATE_SOURCE
"CREATE TABLE Source ( " +
"	SourceId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	SourceTypeId INTEGER NOT NULL REFERENCES SourceType (SourceTypeId), " +
"	SourceAuthor TEXT, " +
"	SourceDirector TEXT,  " +
"	SourceTitle TEXT,  " +
"	SourceYear TEXT,  " +
"	SourceUrl TEXT,  " +
"	SourceRetrievalDate TEXT,  " +
"	SourceTag TEXT UNIQUE, " +
"	SourceCreatedAt TEXT, " +
"	SourceUpdatedAt TEXT " +
") " 

-- CREATE_SOURCE_CREATED_TRIGGER
"CREATE TRIGGER SetSourceCreatedAt  " +
"AFTER INSERT ON Source " +
"BEGIN " +
"UPDATE Source  " +
"	SET SourceCreatedAt = CURRENT_TIMESTAMP,  " +
"		   SourceUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE Source.SourceId = NEW.SourceId; " +
"END " 

-- CREATE_SOURCE_UPDATED_TRIGGER
"CREATE TRIGGER SetSourceUpdatedAt " +
"AFTER UPDATE ON Source " +
"BEGIN " +
"UPDATE Source  " +
"	SET SourceUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE Source.SourceId = NEW.SourceId; " +
"END " 






-- CREATE_SOURCE_LOCATION_SUBSET
"CREATE TABLE SourceLocationSubset ( " +
"	SourceLocationSubsetId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	SourceLocationId INTEGER NOT NULL REFERENCES SourceLocation (SourceLocationId),  " +
"	SourceLocationSubsetValue TEXT NOT NULL, " +
"	SourceLocationSubsetCreatedAt TEXT, " +
"	SourceLocationSubsetUpdatedAt TEXT, " +
"	UNIQUE(SourceLocationId, SourceLocationSubsetValue) " +
") " 

-- CREATE_SOURCE_LOCATION_SUBSET_CREATED_TRIGGER
"CREATE TRIGGER SetSourceLocationSubsetCreatedAt  " +
"AFTER INSERT ON SourceLocationSubset " +
"BEGIN " +
"UPDATE SourceLocationSubset  " +
"	SET SourceLocationSubsetCreatedAt = CURRENT_TIMESTAMP,  " +
"		   SourceLocationSubsetUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceLocationSubset.SourceLocationSubsetId = NEW.SourceLocationSubsetId; " +
"END " 

-- CREATE_SOURCE_LOCATION_SUBSET_UPDATED_TRIGGER
"CREATE TRIGGER SetSourceLocationSubsetUpdatedAt " +
"AFTER UPDATE ON SourceLocationSubset " +
"BEGIN " +
"UPDATE SourceLocationSubset  " +
"	SET SourceLocationSubsetUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceLocationSubset.SourceLocationSubsetId = NEW.SourceLocationSubsetId; " +
"END " 






-- CREATE_SOURCE_LOCATION_SUBSET_ENTRY
"CREATE TABLE SourceLocationSubsetEntry ( " +
"	SourceLocationSubsetEntryId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	SourceLocationSubsetId INTEGER NOT NULL REFERENCES SourceLocationSubset (SourceLocationSubsetId), " +
"	SourceId INTEGER NOT NULL REFERENCES Source (SourceId),  " +
"	SourceLocationSubsetEntryValue TEXT NOT NULL UNIQUE, " +
"	SourceLocationSubsetEntryVerifiedPresentAt TEXT, " +
"	SourceLocationSubsetEntryVerifiedMissingAt TEXT, " +
"	SourceLocationSubsetEntryCreatedAt TEXT, " +
"	SourceLocationSubsetEntryUpdatedAt TEXT, " +
"	UNIQUE(SourceLocationSubsetId, SourceId, SourceLocationSubsetEntryValue) " +
") " 

-- CREATE_SOURCE_LOCATION_SUBSET_ENTRY_CREATED_TRIGGER
"CREATE TRIGGER SetSourceLocationSubsetEntryCreatedAt  " +
"AFTER INSERT ON SourceLocationSubsetEntry " +
"BEGIN " +
"UPDATE SourceLocationSubsetEntry  " +
"	SET SourceLocationSubsetEntryCreatedAt = CURRENT_TIMESTAMP,  " +
"		   SourceLocationSubsetEntryUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceLocationSubsetEntry.SourceLocationSubsetEntryId = NEW.SourceLocationSubsetEntryId; " +
"END " 

-- CREATE_SOURCE_LOCATION_SUBSET_ENTRY_UPDATED_TRIGGER
"CREATE TRIGGER SetSourceLocationSubsetEntryUpdatedAt " +
"AFTER UPDATE ON SourceLocationSubsetEntry " +
"BEGIN " +
"UPDATE SourceLocationSubsetEntry  " +
"	SET SourceLocationSubsetEntryUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE SourceLocationSubsetEntry.SourceLocationSubsetEntryId = NEW.SourceLocationSubsetEntryId; " +
"END " 






-- CREATE_SOURCE_EXCERPT
"CREATE TABLE SourceExcerpt ( " + 
"	SourceExcerptId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	SourceId INTEGER NOT NULL REFERENCES Source (SourceId), " + 
"	SourceExcerptValue TEXT, " + 
"	SourceExcerptPages TEXT,  " + 
"	SourceExcerptBeginTime TEXT,  " + 
"	SourceExcerptEndTime TEXT,  " + 
"	SourceExcerptCreatedAt TEXT, " + 
"	SourceExcerptUpdatedAt TEXT " + 
") " 

-- CREATE_SOURCE_EXCERPT_CREATED_TRIGGER 
"CREATE TRIGGER SetSourceExcerptCreatedAt  " + 
"AFTER INSERT ON SourceExcerpt " + 
"BEGIN " + 
"UPDATE SourceExcerpt  " + 
"	SET SourceExcerptCreatedAt = CURRENT_TIMESTAMP,  " + 
"		   SourceExcerptUpdatedAt = CURRENT_TIMESTAMP " + 
"	WHERE SourceExcerpt.SourceExcerptId = NEW.SourceExcerptId; " + 
"END " 

-- CREATE_SOURCE_EXCERPT_UPDATED_TRIGGER 
"CREATE TRIGGER SetSourceExcerptUpdatedAt " + 
"AFTER UPDATE ON SourceExcerpt " + 
"BEGIN " + 
"UPDATE SourceExcerpt  " + 
"	SET SourceExcerptUpdatedAt = CURRENT_TIMESTAMP " + 
"	WHERE SourceExcerpt.SourceExcerptId = NEW.SourceExcerptId; " + 
"END " 






-- CREATE_SOURCE_EXCERPT_ANNOTATION 
"CREATE TABLE SourceExcerptAnnotation ( " + 
"	SourceExcerptAnnotationId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	SourceExcerptId INTEGER NOT NULL REFERENCES SourceExcerpt (SourceExcerptId),  " + 
"	SourceAnnotationId INTEGER NOT NULL REFERENCES SourceAnnotation (SourceAnnotationId), " + 
"	SourceExcerptAnnotationLinkedAt TEXT, " + 
"	SourceExcerptAnnotationUnlinkedAt TEXT, " + 
"	SourceExcerptAnnotationCreatedAt TEXT, " + 
"	SourceExcerptAnnotationUpdatedAt TEXT,  " + 
"	UNIQUE(SourceExcerptId, SourceAnnotationId) " + 
") " 

-- CREATE_SOURCE_EXCERPT_ANNOTATION_CREATED_TRIGGER 
"CREATE TRIGGER SetSourceExcerptAnnotationCreatedAt  " + 
"AFTER INSERT ON SourceExcerptAnnotation " + 
"BEGIN " + 
"UPDATE SourceExcerptAnnotation  " + 
"	SET SourceExcerptAnnotationCreatedAt = CURRENT_TIMESTAMP,  " + 
"		   SourceExcerptAnnotationUpdatedAt = CURRENT_TIMESTAMP, " + 
"		   SourceExcerptAnnotationLinkedAt = CURRENT_TIMESTAMP " + 
"	WHERE SourceExcerptAnnotation.SourceExcerptAnnotationId = NEW.SourceExcerptAnnotationId; " + 
"END " 

-- CREATE_SOURCE_EXCERPT_ANNOTATION_UPDATED_TRIGGER 
"CREATE TRIGGER SetSourceExcerptAnnotationUpdatedAt " + 
"AFTER UPDATE ON SourceExcerptAnnotation " + 
"BEGIN " + 
"UPDATE SourceExcerptAnnotation  " + 
"	SET SourceExcerptAnnotationUpdatedAt = CURRENT_TIMESTAMP " + 
"	WHERE SourceExcerptAnnotation.SourceExcerptAnnotationId = NEW.SourceExcerptAnnotationId; " + 
"END " 






-- CREATE_SOURCE_EXCERPT_TAGGING 
"CREATE TABLE SourceExcerptTagging ( " + 
"	SourceExcerptTaggingId INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	SourceExcerptId INTEGER NOT NULL REFERENCES SourceExcerpt (SourceExcerptId),  " + 
"	MediaTagId INTEGER NOT NULL REFERENCES MediaTag (MediaTagId), " + 
"	SourceExcerptTaggingTaggedAt TEXT, " + 
"	SourceExcerptTaggingUntaggedAt TEXT, " + 
"	SourceExcerptTaggingCreatedAt TEXT, " + 
"	SourceExcerptTaggingUpdatedAt TEXT,  " + 
"	UNIQUE(SourceExcerptId, MediaTagId) " + 
") " 

-- CREATE_SOURCE_EXCERPT_TAGGING_CREATED_TRIGGER 
"CREATE TRIGGER SetSourceExcerptTaggingCreatedAt  " + 
"AFTER INSERT ON SourceExcerptTagging " + 
"BEGIN " + 
"UPDATE SourceExcerptTagging  " + 
"	SET SourceExcerptTaggingCreatedAt = CURRENT_TIMESTAMP,  " + 
"		   SourceExcerptTaggingUpdatedAt = CURRENT_TIMESTAMP, " + 
"		   SourceExcerptTaggingTaggedAt = CURRENT_TIMESTAMP " + 
"	WHERE SourceExcerptTagging.SourceExcerptTaggingId = NEW.SourceExcerptTaggingId; " + 
"END " 

-- CREATE_SOURCE_EXCERPT_TAGGING_UPDATED_TRIGGER 
"CREATE TRIGGER SetSourceExcerptTaggingUpdatedAt " + 
"AFTER UPDATE ON SourceExcerptTagging " + 
"BEGIN " + 
"UPDATE SourceExcerptTagging  " + 
"	SET SourceExcerptTaggingUpdatedAt = CURRENT_TIMESTAMP " + 
"	WHERE SourceExcerptTagging.SourceExcerptTaggingId = NEW.SourceExcerptTaggingId; " + 
"END " 







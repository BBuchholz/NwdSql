-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE MediaTag ( " +
"	" + COLUMN_MEDIA_TAG_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	" + COLUMN_MEDIA_TAG_VALUE + " TEXT NOT NULL UNIQUE, " +
"	MediaTagCreatedAt TEXT, " +
"	MediaTagUpdatedAt TEXT " +
") "

-- updated at trigger " +
"CREATE TRIGGER SetMediaTagUpdatedAt " +
"AFTER UPDATE ON MediaTag " +
"BEGIN " +
"UPDATE MediaTag  " +
"	SET MediaTagUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE MediaTag." + COLUMN_MEDIA_TAG_ID + " = NEW." + COLUMN_MEDIA_TAG_ID + "; " +
"END " 

-- created at & updated at trigger " +
"CREATE TRIGGER SetMediaTagCreatedAt  " +
"AFTER INSERT ON MediaTag " +
"BEGIN " +
"UPDATE MediaTag  " +
"	SET MediaTagCreatedAt = CURRENT_TIMESTAMP,  " +
"		   MediaTagUpdatedAt = CURRENT_TIMESTAMP " +
"	WHERE MediaTag." + COLUMN_MEDIA_TAG_ID + " = NEW." + COLUMN_MEDIA_TAG_ID + "; " +
"END "
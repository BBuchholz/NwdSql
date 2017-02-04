-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_MEDIA_TRANSCRIPT + " ( " +
"	" + COLUMN_MEDIA_TRANSCRIPT_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  " +
"	" + COLUMN_MEDIA_TRANSCRIPT_VALUE + " TEXT, " +
"	" + COLUMN_MEDIA_TRANSCRIPT_BEGIN_TIME + " TEXT,  " +
"	" + COLUMN_MEDIA_TRANSCRIPT_END_TIME + " TEXT,  " +
"	" + COLUMN_MEDIA_TRANSCRIPT_CREATED_AT + " TEXT, " +
"	" + COLUMN_MEDIA_TRANSCRIPT_UPDATED_AT + " TEXT,  " +
"	UNIQUE(" + COLUMN_MEDIA_TRANSCRIPT_BEGIN_TIME + ", " + COLUMN_MEDIA_TRANSCRIPT_END_TIME + ") " +
") " 

-- updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_TRANSCRIPT + "UpdatedAt " +
"AFTER UPDATE ON " + TABLE_MEDIA_TRANSCRIPT + " " +
"BEGIN " +
"UPDATE " + TABLE_MEDIA_TRANSCRIPT + "  " +
"	SET " + COLUMN_MEDIA_TRANSCRIPT_UPDATED_AT + " = CURRENT_TIMESTAMP " +
"	WHERE " + TABLE_MEDIA_TRANSCRIPT + "." + COLUMN_MEDIA_TRANSCRIPT_ID + " = NEW." + COLUMN_MEDIA_TRANSCRIPT_ID + "; " +
"END " 

-- created at & updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_TRANSCRIPT + "CreatedAt  " +
"AFTER INSERT ON " + TABLE_MEDIA_TRANSCRIPT + " " +
"BEGIN " +
"UPDATE " + TABLE_MEDIA_TRANSCRIPT + "  " +
"	SET " + COLUMN_MEDIA_TRANSCRIPT_CREATED_AT + " = CURRENT_TIMESTAMP,  " +
"		   " + COLUMN_MEDIA_TRANSCRIPT_UPDATED_AT + " = CURRENT_TIMESTAMP " +
"	WHERE " + TABLE_MEDIA_TRANSCRIPT + "." + COLUMN_MEDIA_TRANSCRIPT_ID + " = NEW." + COLUMN_MEDIA_TRANSCRIPT_ID + "; " +
"END " 
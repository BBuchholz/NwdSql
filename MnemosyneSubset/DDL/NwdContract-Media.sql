-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_MEDIA + " ( " + 
"	" + COLUMN_MEDIA_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	" + COLUMN_MEDIA_FILE_NAME + " TEXT, " + 
"	" + COLUMN_MEDIA_DESCRIPTION + " TEXT,  " + 
"	" + COLUMN_MEDIA_HASH + " TEXT,  " + 
"	" + COLUMN_MEDIA_CREATED_AT + " TEXT, " + 
"	" + COLUMN_MEDIA_UPDATED_AT + " TEXT,   " + 
"	UNIQUE(" + COLUMN_MEDIA_HASH + ") " + 
") " 

-- updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA + "UpdatedAt " + 
"AFTER UPDATE ON " + TABLE_MEDIA + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA + "  " + 
"	SET " + COLUMN_MEDIA_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA + "." + COLUMN_MEDIA_ID + " = NEW." + COLUMN_MEDIA_ID + "; " + 
"END " 

-- created at & updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA + "CreatedAt  " + 
"AFTER INSERT ON " + TABLE_MEDIA + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA + "  " + 
"	SET " + COLUMN_MEDIA_CREATED_AT + " = CURRENT_TIMESTAMP,  " + 
"		   " + COLUMN_MEDIA_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA + "." + COLUMN_MEDIA_ID + " = NEW." + COLUMN_MEDIA_ID + "; " + 
"END " 
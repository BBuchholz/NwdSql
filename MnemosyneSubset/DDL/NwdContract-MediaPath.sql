-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_MEDIA_PATH + " ( " + 
"	" + COLUMN_MEDIA_PATH_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	" + COLUMN_MEDIA_PATH_VALUE + " TEXT NOT NULL UNIQUE, " + 
"	" + COLUMN_MEDIA_PATH_CREATED_AT + " TEXT, " + 
"	" + COLUMN_MEDIA_PATH_UPDATED_AT + " TEXT " + 
") "

-- updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_PATH + "UpdatedAt " + 
"AFTER UPDATE ON " + TABLE_MEDIA_PATH + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA_PATH + "  " + 
"	SET " + COLUMN_MEDIA_PATH_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA_PATH + "." + COLUMN_MEDIA_PATH_ID + " = NEW." + COLUMN_MEDIA_PATH_ID + "; " + 
"END "

-- created at & updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_PATH + "CreatedAt  " + 
"AFTER INSERT ON " + TABLE_MEDIA_PATH + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA_PATH + "  " + 
"	SET " + COLUMN_MEDIA_PATH_CREATED_AT + " = CURRENT_TIMESTAMP,  " + 
"		   " + COLUMN_MEDIA_PATH_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA_PATH + "." + COLUMN_MEDIA_PATH_ID + " = NEW." + COLUMN_MEDIA_PATH_ID + "; " + 
"END "
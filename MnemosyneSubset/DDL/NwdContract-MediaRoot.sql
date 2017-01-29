-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_MEDIA_ROOT + " ( " + 
"	" + COLUMN_MEDIA_ROOT_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	" + COLUMN_MEDIA_DEVICE_ID + " INTEGER NOT NULL REFERENCES " + TABLE_MEDIA_DEVICE + " (" + COLUMN_MEDIA_DEVICE_ID + "),  " + 
"	" + COLUMN_MEDIA_ROOT_PATH + " TEXT NOT NULL UNIQUE, " + 
"	" + COLUMN_MEDIA_ROOT_CREATED_AT + " TEXT, " + 
"	" + COLUMN_MEDIA_ROOT_UPDATED_AT + " TEXT " + 
") " 

-- updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_ROOT + "UpdatedAt " + 
"AFTER UPDATE ON " + TABLE_MEDIA_ROOT + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA_ROOT + "  " + 
"	SET " + COLUMN_MEDIA_ROOT_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA_ROOT + "." + COLUMN_MEDIA_ROOT_ID + " = NEW." + COLUMN_MEDIA_ROOT_ID + "; " + 
"END " 

-- created at & updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_ROOT + "CreatedAt  " + 
"AFTER INSERT ON " + TABLE_MEDIA_ROOT + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA_ROOT + "  " + 
"	SET " + COLUMN_MEDIA_ROOT_CREATED_AT + " = CURRENT_TIMESTAMP,  " + 
"		   " + COLUMN_MEDIA_ROOT_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA_ROOT + "." + COLUMN_MEDIA_ROOT_ID + " = NEW." + COLUMN_MEDIA_ROOT_ID + "; " + 
"END " 
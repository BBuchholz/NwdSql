-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_MEDIA_DEVICE + " ( " + 
"	" + COLUMN_MEDIA_DEVICE_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	" + COLUMN_MEDIA_DEVICE_DESCRIPTION + " TEXT NOT NULL UNIQUE, " + 
"	" + COLUMN_MEDIA_DEVICE_CREATED_AT + " TEXT, " + 
"	" + COLUMN_MEDIA_DEVICE_UPDATED_AT + " TEXT " + 
") " 

-- updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_DEVICE + "UpdatedAt " + 
"AFTER UPDATE ON " + TABLE_MEDIA_DEVICE + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA_DEVICE + "  " + 
"	SET " + COLUMN_MEDIA_DEVICE_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA_DEVICE + "." + COLUMN_MEDIA_DEVICE_ID + " = NEW." + COLUMN_MEDIA_DEVICE_ID + "; " + 
"END " 

-- created at & updated at trigger
"CREATE TRIGGER Set" + TABLE_MEDIA_DEVICE + "CreatedAt  " + 
"AFTER INSERT ON " + TABLE_MEDIA_DEVICE + " " + 
"BEGIN " + 
"UPDATE " + TABLE_MEDIA_DEVICE + "  " + 
"	SET " + COLUMN_MEDIA_DEVICE_CREATED_AT + " = CURRENT_TIMESTAMP,  " + 
"		   " + COLUMN_MEDIA_DEVICE_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_MEDIA_DEVICE + "." + COLUMN_MEDIA_DEVICE_ID + " = NEW." + COLUMN_MEDIA_DEVICE_ID + "; " + 
"END " 
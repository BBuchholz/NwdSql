-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_LOCAL_CONFIG + " ( " + 
"	" + COLUMN_LOCAL_CONFIG_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  " + 
"	" + COLUMN_LOCAL_CONFIG_KEY + " TEXT NOT NULL UNIQUE,  " + 
"	" + COLUMN_LOCAL_CONFIG_VALUE + " TEXT, " + 
"	" + COLUMN_LOCAL_CONFIG_CREATED_AT + " TEXT, " + 
"	" + COLUMN_LOCAL_CONFIG_UPDATED_AT + " TEXT, " + 
"	UNIQUE(" + COLUMN_LOCAL_CONFIG_KEY + ", " + COLUMN_LOCAL_CONFIG_VALUE + ") " + 
") " 

-- updated at trigger
"CREATE TRIGGER Set" + TABLE_LOCAL_CONFIG + "UpdatedAt " + 
"AFTER UPDATE ON " + TABLE_LOCAL_CONFIG + " " + 
"BEGIN " + 
"UPDATE " + TABLE_LOCAL_CONFIG + "  " + 
"	SET " + COLUMN_LOCAL_CONFIG_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_LOCAL_CONFIG + "." + COLUMN_LOCAL_CONFIG_ID + " = NEW." + COLUMN_LOCAL_CONFIG_ID + "; " + 
"END " 

-- created at & updated at trigger
"CREATE TRIGGER Set" + TABLE_LOCAL_CONFIG + "CreatedAt  " + 
"AFTER INSERT ON " + TABLE_LOCAL_CONFIG + " " + 
"BEGIN " + 
"UPDATE " + TABLE_LOCAL_CONFIG + "  " + 
"	SET " + COLUMN_LOCAL_CONFIG_CREATED_AT + " = CURRENT_TIMESTAMP,  " + 
"		   " + COLUMN_LOCAL_CONFIG_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_LOCAL_CONFIG + "." + COLUMN_LOCAL_CONFIG_ID + " = NEW." + COLUMN_LOCAL_CONFIG_ID + "; " + 
"END " 
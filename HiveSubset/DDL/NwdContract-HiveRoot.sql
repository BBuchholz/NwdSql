-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_HIVE_ROOT + " ( " + 
"	" + COLUMN_HIVE_ROOT_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE, " + 
"	" + COLUMN_HIVE_ROOT_NAME + " TEXT NOT NULL UNIQUE, " + 
"	" + COLUMN_HIVE_ROOT_ACTIVATED_AT + " TEXT, " + 
"	" + COLUMN_HIVE_ROOT_DEACTIVATED_AT + " TEXT,  " + 
"	" + COLUMN_HIVE_ROOT_CREATED_AT + " TEXT, " + 
"	" + COLUMN_HIVE_ROOT_UPDATED_AT + " TEXT " + 
") " 

-- updated at trigger
"CREATE TRIGGER Set" + COLUMN_HIVE_ROOT_UPDATED_AT + " " + 
"AFTER UPDATE ON " + TABLE_HIVE_ROOT + " " + 
"BEGIN " + 
"UPDATE " + TABLE_HIVE_ROOT + "  " + 
"	SET " + COLUMN_HIVE_ROOT_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_HIVE_ROOT + "." + COLUMN_HIVE_ROOT_ID + " = NEW." + COLUMN_HIVE_ROOT_ID + "; " + 
"END " 

-- created at & updated at trigger
"CREATE TRIGGER Set" + COLUMN_HIVE_ROOT_CREATED_AT + "  " + 
"AFTER INSERT ON " + TABLE_HIVE_ROOT + " " + 
"BEGIN " + 
"UPDATE " + TABLE_HIVE_ROOT + "  " + 
"	SET " + COLUMN_HIVE_ROOT_CREATED_AT + " = CURRENT_TIMESTAMP,  " + 
"		   " + COLUMN_HIVE_ROOT_UPDATED_AT + " = CURRENT_TIMESTAMP " + 
"	WHERE " + TABLE_HIVE_ROOT + "." + COLUMN_HIVE_ROOT_ID + " = NEW." + COLUMN_HIVE_ROOT_ID + "; " + 
"END " 

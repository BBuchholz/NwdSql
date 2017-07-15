-- SELECT_ACTIVE_HIVE_ROOTS
"SELECT " + COLUMN_HIVE_ROOT_ID + ", " + 
"       " + COLUMN_HIVE_ROOT_NAME + ", " + 
"	    " + COLUMN_HIVE_ROOT_ACTIVATED_AT + ", " + 
"	    " + COLUMN_HIVE_ROOT_DEACTIVATED_AT + " " + 
"FROM " + TABLE_HIVE_ROOT + " " 

-- SELECT_HIVE_ROOT_ID_FOR_NAME_X
"SELECT " + COLUMN_HIVE_ROOT_ID + " " + 
"FROM " + TABLE_HIVE_ROOT + " " +
"WHERE " + COLUMN_HIVE_ROOT_NAME + " = ? "

-- INSERT_HIVE_ROOT_NAME_X
"INSERT OR IGNORE INTO " + TABLE_HIVE_ROOT + " " + 
"	(" + COLUMN_HIVE_ROOT_NAME + ") " + 
"VALUES " + 
"	(?) " 




-- for autocomplete
COLUMN_HIVE_ROOT_ID
COLUMN_HIVE_ROOT_NAME
COLUMN_HIVE_ROOT_ACTIVATED_AT
COLUMN_HIVE_ROOT_DEACTIVATED_AT
COLUMN_HIVE_ROOT_CREATED_AT
COLUMN_HIVE_ROOT_UPDATED_AT
TABLE_HIVE_ROOT
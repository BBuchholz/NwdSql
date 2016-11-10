-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

"CREATE TABLE " + TABLE_SYNERGY_LIST + " ( "
	+ COLUMN_SYNERGY_LIST_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  "
	+ COLUMN_SYNERGY_LIST_NAME + " TEXT NOT NULL UNIQUE, "
	+ COLUMN_SYNERGY_LIST_ACTIVATE_AT + " TEXT, "
	+ COLUMN_SYNERGY_LIST_SHELVED_AT + " TEXT, "
	+ COLUMN_SYNERGY_LIST_CREATED_AT + " TEXT, "
	+ COLUMN_SYNERGY_LIST_UPDATED_AT + " TEXT "
+ ") " 

"CREATE TRIGGER Set" + TABLE_SYNERGY_LIST + "UpdatedAt  "
+ "AFTER UPDATE ON " + TABLE_SYNERGY_LIST + " "
+ "BEGIN "
+ "UPDATE " + TABLE_SYNERGY_LIST + " "
	+ "SET " + COLUMN_SYNERGY_LIST_UPDATED_AT + " = CURRENT_TIMESTAMP "
	+ "WHERE " + TABLE_SYNERGY_LIST + "." + COLUMN_SYNERGY_LIST_ID + " = NEW." + COLUMN_SYNERGY_LIST_ID + "; "
+ "END "

"CREATE TRIGGER Set" + TABLE_SYNERGY_LIST + "CreatedAt  "
+ "AFTER INSERT ON " + TABLE_SYNERGY_LIST + " "
+ "BEGIN "
+ "UPDATE " + TABLE_SYNERGY_LIST + "  "
	+ "SET " + COLUMN_SYNERGY_LIST_CREATED_AT + " = CURRENT_TIMESTAMP,  "
		   + COLUMN_SYNERGY_LIST_UPDATED_AT + " = CURRENT_TIMESTAMP, "
		   + COLUMN_SYNERGY_LIST_ACTIVATE_AT + " = CURRENT_TIMESTAMP "
	+ "WHERE " + TABLE_SYNERGY_LIST + "." + COLUMN_SYNERGY_LIST_ID + " = NEW." + COLUMN_SYNERGY_LIST_ID + "; "
+ "END "
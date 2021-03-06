-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
"CREATE TABLE " + TABLE_SYNERGY_LIST_ITEM + " ( "
+ COLUMN_SYNERGY_LIST_ITEM_ID + " INTEGER NOT NULL PRIMARY KEY UNIQUE,  "
+ COLUMN_SYNERGY_LIST_ID + " INTEGER NOT NULL REFERENCES " + TABLE_SYNERGY_LIST + " (" + COLUMN_SYNERGY_LIST_ID + "),  "
+ COLUMN_SYNERGY_ITEM_ID + " INTEGER NOT NULL REFERENCES " + TABLE_SYNERGY_ITEM + " (" + COLUMN_SYNERGY_ITEM_ID + "), "
+ COLUMN_SYNERGY_LIST_ITEM_POSITION + " INTEGER, "
+ COLUMN_SYNERGY_LIST_ITEM_CREATED_AT + " TEXT, "
+ COLUMN_SYNERGY_LIST_ITEM_UPDATED_AT + " TEXT,  "
+ "	UNIQUE(" + COLUMN_SYNERGY_LIST_ID + ", " + COLUMN_SYNERGY_ITEM_ID + ") "
+ ") "

-- updated at trigger 
"CREATE TRIGGER Set" + TABLE_SYNERGY_LIST_ITEM + "UpdatedAt "
+ "AFTER UPDATE ON " + TABLE_SYNERGY_LIST_ITEM + " "
+ "BEGIN "
+ "UPDATE " + TABLE_SYNERGY_LIST_ITEM + "  "
+ "	SET " + COLUMN_SYNERGY_LIST_ITEM_UPDATED_AT + " = CURRENT_TIMESTAMP "
+ "	WHERE " + TABLE_SYNERGY_LIST_ITEM + "." + COLUMN_SYNERGY_LIST_ITEM_ID + " = NEW." + COLUMN_SYNERGY_LIST_ITEM_ID + "; "
+ "END "

-- created at & updated at trigger 
"CREATE TRIGGER Set" + TABLE_SYNERGY_LIST_ITEM + "CreatedAt  "
+ "AFTER INSERT ON " + TABLE_SYNERGY_LIST_ITEM + " "
+ "BEGIN "
+ "UPDATE " + TABLE_SYNERGY_LIST_ITEM + "  "
+ "	SET " + COLUMN_SYNERGY_LIST_ITEM_CREATED_AT + " = CURRENT_TIMESTAMP,  "
+ "		   " + COLUMN_SYNERGY_LIST_ITEM_UPDATED_AT + " = CURRENT_TIMESTAMP "
+ "	WHERE " + TABLE_SYNERGY_LIST_ITEM + "." + COLUMN_SYNERGY_LIST_ITEM_ID + " = NEW." + COLUMN_SYNERGY_LIST_ITEM_ID + "; "
+ "END "

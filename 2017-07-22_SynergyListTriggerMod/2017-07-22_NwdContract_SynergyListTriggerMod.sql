-- remove old trigger
"DROP TRIGGER IF EXISTS Set" + TABLE_SYNERGY_LIST + "CreatedAt "

-- NEW created at & updated at trigger
"CREATE TRIGGER Set" + TABLE_SYNERGY_LIST + "CreatedAt  "
+ "AFTER INSERT ON " + TABLE_SYNERGY_LIST + " "
+ "BEGIN "
+ "UPDATE " + TABLE_SYNERGY_LIST + "  "
	+ "SET " + COLUMN_SYNERGY_LIST_CREATED_AT + " = CURRENT_TIMESTAMP,  "
		   + COLUMN_SYNERGY_LIST_UPDATED_AT + " = CURRENT_TIMESTAMP "
	+ "WHERE " + TABLE_SYNERGY_LIST + "." + COLUMN_SYNERGY_LIST_ID + " = NEW." + COLUMN_SYNERGY_LIST_ID + "; "
+ "END "
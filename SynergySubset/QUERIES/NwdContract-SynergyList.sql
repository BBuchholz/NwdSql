-- SELECT_ACTIVE_LISTS
"SELECT " + COLUMN_SYNERGY_LIST_NAME + " "
+ "FROM " + TABLE_SYNERGY_LIST + " "
+ "WHERE " + COLUMN_SYNERGY_LIST_SHELVED_AT + " IS NULL "
+ "   OR " + COLUMN_SYNERGY_LIST_ACTIVATED_AT + " > " + COLUMN_SYNERGY_LIST_SHELVED_AT + "; "

-- ENSURE_LIST_NAME_X
"INSERT OR IGNORE INTO " + TABLE_SYNERGY_LIST + " "
+ "	(" + COLUMN_SYNERGY_LIST_NAME + ", " + COLUMN_SYNERGY_LIST_ACTIVATED_AT + ") "
+ "VALUES "
+ "	(?, CURRENT_TIMESTAMP); "
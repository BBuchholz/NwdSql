-- single line
DELETE FROM junction_File_Tag WHERE FileId = ?

-- identical for ease of read
DELETE FROM junction_File_Tag 
WHERE FileId = ?

-- contract format
"DELETE FROM " + NwdContract.TABLE_JUNCTION_FILE_TAG + 
" WHERE " + NwdContract.COLUMN_FILE_ID + " = ? ";
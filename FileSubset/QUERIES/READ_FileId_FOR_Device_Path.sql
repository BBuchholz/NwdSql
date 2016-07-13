-- single line
SELECT FileId FROM File f JOIN Path p ON f.PathId = p.PathId JOIN Device d ON d.DeviceId = f.DeviceId WHERE d.DeviceDescription = ? AND p.PathValue = ? 

-- identical for ease of read
SELECT FileId 
FROM File f 
JOIN Path p ON f.PathId = p.PathId 
JOIN Device d ON d.DeviceId = f.DeviceId 
WHERE d.DeviceDescription = ? 
AND p.PathValue = ?

-- contract format
"SELECT " + NwdContract.COLUMN_FILE_ID + " " +
"FROM " + NwdContract.TABLE_FILE + " f " +
"JOIN " + NwdContract.TABLE_PATH + " p  " +
"ON f." + NwdContract.COLUMN_PATH_ID + 
    " = p." + NwdContract.COLUMN_PATH_ID + " " +
"JOIN " + NwdContract.TABLE_DEVICE + " d  " +
"ON d." + NwdContract.COLUMN_DEVICE_ID + 
    " = f." + NwdContract.COLUMN_DEVICE_ID + " " +
"WHERE d." + NwdContract.COLUMN_DEVICE_DESCRIPTION + " = ? " +
"AND p." + NwdContract.COLUMN_PATH_VALUE + " = ? ";
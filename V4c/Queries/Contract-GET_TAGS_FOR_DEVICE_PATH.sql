"SELECT " +
        "" + NwdContract.COLUMN_TAG_VALUE + " " +
"FROM " + NwdContract.TABLE_PATH + " p " +
"JOIN " + NwdContract.TABLE_FILE + " f " +
"ON p." + NwdContract.COLUMN_PATH_ID + " = f." + NwdContract.COLUMN_PATH_ID + " " +
"JOIN " + NwdContract.TABLE_JUNCTION_FILE_TAG + " ft " +
"ON f." + NwdContract.COLUMN_FILE_ID + " = ft." + NwdContract.COLUMN_FILE_ID + " " +
"JOIN " + NwdContract.TABLE_TAG + " t " +
"ON ft." + NwdContract.COLUMN_TAG_ID + " = t." + NwdContract.COLUMN_TAG_ID + " " +
"JOIN " + NwdContract.TABLE_DEVICE + " d " +
"ON d." + NwdContract.COLUMN_DEVICE_ID + " = f." + NwdContract.COLUMN_DEVICE_ID + " " +
"WHERE d." + NwdContract.COLUMN_DEVICE_DESCRIPTION + " = ? " + 
"AND p." + NwdContract.COLUMN_PATH_VALUE + " = ? ; ";
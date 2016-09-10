"INSERT OR IGNORE INTO " + NwdContract.TABLE_FILE +
        " (" + NwdContract.COLUMN_DEVICE_ID + ", " +
        NwdContract.COLUMN_PATH_ID + ") " +
"VALUES ( " +
    "(SELECT " + NwdContract.COLUMN_DEVICE_ID + " " +
             "FROM " + NwdContract.TABLE_DEVICE + " " +
             "WHERE " + NwdContract.COLUMN_DEVICE_DESCRIPTION + " = ?), " +
    "(SELECT " + NwdContract.COLUMN_PATH_ID + " " +
             "FROM " + NwdContract.TABLE_PATH + " " +
             "WHERE " + NwdContract.COLUMN_PATH_VALUE + " = ?)); ";
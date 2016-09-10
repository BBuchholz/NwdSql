"INSERT OR IGNORE INTO " + NwdContract.TABLE_JUNCTION_FILE_TAG + " " +
        "(" + NwdContract.COLUMN_FILE_ID + ", " +
        NwdContract.COLUMN_TAG_ID + ") " +
"VALUES ( " +
    "(SELECT " + NwdContract.COLUMN_FILE_ID + " " +
             "FROM " + NwdContract.TABLE_FILE + " " +
             "WHERE " + NwdContract.COLUMN_DEVICE_ID + " = " +
                "(SELECT " + NwdContract.COLUMN_DEVICE_ID + " " +
                 "FROM " + NwdContract.TABLE_DEVICE + " " +
                 "WHERE " + NwdContract.COLUMN_DEVICE_DESCRIPTION + " = ?) " +
             "AND " + NwdContract.COLUMN_PATH_ID + " = " +
                "(SELECT " + NwdContract.COLUMN_PATH_ID + " " +
                 "FROM " + NwdContract.TABLE_PATH + " " +
                 "WHERE " + NwdContract.COLUMN_PATH_VALUE + " = ?)), " +
    "(SELECT " + NwdContract.COLUMN_TAG_ID + " " +
             "FROM " + NwdContract.TABLE_TAG + " " +
             "WHERE " + NwdContract.COLUMN_TAG_VALUE + " = ?)); ";
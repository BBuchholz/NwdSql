-- SELECT_TYPE_ID_TYPE_VALUE_FROM_SOURCE_TYPE
SELECT SourceTypeId, 
	   SourceTypeValue 
FROM SourceType;

-- SELECT_SOURCE_TYPE_ID_FOR_VALUE_X
SELECT SourceTypeId
FROM SourceType
WHERE SourceTypeValue = ? ;

-- SELECT_SOURCE_EXCERPT_TYPE_ID_X_Y
SELECT SourceExcerptId
FROM SourceExcerpt
WHERE SourceId = ?
AND SourceExcerptValue = ? ;

-- INSERT_OR_IGNORE_SOURCE_TYPE_VALUE
INSERT OR IGNORE INTO SourceType 
	(SourceTypeValue)
VALUES 
	(?);

-- INSERT_OR_IGNORE_SOURCE_TYPE_VALUE
INSERT OR IGNORE INTO SourceExcerpt 
	(SourceId, SourceExcerptValue)
VALUES 
	(?, ?);

-- SELECT_SOURCES_BY_TYPE_ID_X
SELECT SourceId,
	   SourceTypeId,
	   SourceTitle,
	   SourceAuthor,
	   SourceDirector,
	   SourceYear,
	   SourceUrl,
	   SourceRetrievalDate 
FROM Source
WHERE SourceTypeId = ?;

-- SELECT_SOURCE_ID_W_X_Y_Z
SELECT SourceId,
	   SourceTypeId,
	   SourceTitle,
	   SourceAuthor,
	   SourceDirector,
	   SourceYear,
	   SourceUrl,
	   SourceRetrievalDate 
FROM Source 
WHERE SourceTypeId = ? 
AND TRIM(IFNULL(SourceTitle, '')) = TRIM(IFNULL(?, '')) 
AND TRIM(IFNULL(SourceYear, '')) = TRIM(IFNULL(?, '')) 
AND TRIM(IFNULL(SourceUrl, '')) = TRIM(IFNULL(?, ''));

-- INSERT_SOURCE_T_U_V_W_X_Y_Z
INSERT OR IGNORE INTO Source
	(SourceTypeId,
	 SourceTitle,
	 SourceAuthor,
	 SourceDirector,
	 SourceYear,
	 SourceUrl,
	 SourceRetrievalDate)
VALUES
	(?,?,?,?,?,?,?);

-- SELECT_EXCERPTS_WITH_TAGS_FOR_SOURCE_ID_X
SELECT  sext.SourceExcerptTaggingId,
		se.SourceExcerptId,
		se.SourceId,
		se.SourceExcerptValue,
		mt.MediaTagId,
		mt.MediaTagValue	
FROM SourceExcerpt se 
LEFT JOIN SourceExcerptTagging sext
ON se.SourceExcerptId = sext.SourceExcerptId
LEFT JOIN MediaTag mt
ON sext.MediaTagId = mt.MediaTagId
WHERE se.SourceId = ? ;

-- SELECT_EXCERPTS_WITH_TAGGED_TAGS_FOR_SOURCE_ID_X
SELECT  sext.SourceExcerptTaggingId,
		se.SourceExcerptId,
		se.SourceId,
		se.SourceExcerptValue,
		mt.MediaTagId,
		mt.MediaTagValue	
FROM SourceExcerpt se 
LEFT JOIN SourceExcerptTagging sext
ON se.SourceExcerptId = sext.SourceExcerptId
LEFT JOIN MediaTag mt
ON sext.MediaTagId = mt.MediaTagId
WHERE se.SourceId = ? 
AND IFNULL(sext.SourceExcerptTaggingTaggedAt, '') >= IFNULL(sext.SourceExcerptTaggingUntaggedAt, '');

-- UPDATE_SOURCE_EXCERPT_TAGGING_TIMESTAMPS_X_Y_Z
UPDATE SourceExcerptTagging 
SET SourceExcerptTaggingTaggedAt = MAX(IFNULL(SourceExcerptTaggingTaggedAt, ''), ?),
	SourceExcerptTaggingUntaggedAt = MAX(IFNULL(SourceExcerptTaggingUntaggedAt, ''), ?)
WHERE SourceExcerptTaggingId = ? ;

-- UPDATE_SOURCE_TAG_WHERE_SOURCE_ID
UPDATE Source
SET SourceTag = ? 
WHERE SourceId = ? ;

-- SELECT_SOURCE_EXCERPT_TAGGING_ID_X_Y
SELECT SourceExcerptTaggingId
FROM SourceExcerptTagging
WHERE SourceExcerptId = ? 
AND MediaTagId = ? ;

-- INSERT_OR_IGNORE_EXCERPT_TAGGING_X_Y
INSERT OR IGNORE INTO SourceExcerptTagging
	(SourceExcerptId, MediaTagId)
VALUES
	(?, ?);

-- SELECT_EXCERPTS_WITH_SOURCE_FOR_TAG_ID_X
SELECT  sext.SourceExcerptTaggingId,
		se.SourceExcerptId,
		se.SourceExcerptValue,
		mt.MediaTagId,
		mt.MediaTagValue,
		s.SourceId,
		s.SourceAuthor,
		s.SourceTitle,
		s.SourceUrl,
		st.SourceTypeValue
FROM SourceExcerpt se 
JOIN Source s
ON se.SourceId = s.SourceId
JOIN SourceType st
ON s.SourceTypeId = st.SourceTypeId
LEFT JOIN SourceExcerptTagging sext
ON se.SourceExcerptId = sext.SourceExcerptId
LEFT JOIN MediaTag mt
ON sext.MediaTagId = mt.MediaTagId
WHERE sext.SourceExcerptId IN (SELECT SourceExcerptId FROM SourceExcerptTagging WHERE MediaTagId = ? )
AND IFNULL(sext.SourceExcerptTaggingTaggedAt, '') >= IFNULL(sext.SourceExcerptTaggingUntaggedAt, '');



-- these queries are for use outside of the code environment
-- basically for doing lookups in an external db browser when
-- testing functionality we are coding

-- I'm building them verbose, to include each relevant field 
-- explicitly, in usage, simply copy/paste these into
-- the query window and delete whatever fields you don't need

---------------------------------------------------------------------
-- DO NOT OPEN THESE FILES DIRECTLY IN THE QUERY WINDOW
-- (we don't want to overwrite them with an accidental save)
---------------------------------------------------------------------

-- select source annotations
SELECT st.SourceTypeId,
       s.SourceId,
       se.SourceExcerptId,
       sea.SourceExcerptAnnotationId,
       sa.SourceAnnotationId,
       st.SourceTypeValue,
       s.SourceAuthor,
       s.SourceDirector,
       s.SourceTitle,
       s.SourceYear,
       s.SourceUrl,
       s.SourceRetrievalDate,
       s.SourceTag,
       se.SourceExcerptValue,
       se.SourceExcerptPages,
       se.SourceExcerptBeginTime,
       se.SourceExcerptEndTime,
       sea.SourceExcerptAnnotationLinkedAt,
       sea.SourceExcerptAnnotationUnlinkedAt,
       sa.SourceAnnotationValue
FROM Source s
JOIN SourceType st
ON s.SourceTypeId = st.SourceTypeId
JOIN SourceExcerpt se
ON s.SourceId = se.SourceId
JOIN SourceExcerptAnnotation sea
ON se.SourceExcerptId = sea.SourceExcerptId
JOIN SourceAnnotation sa
ON sa.SourceAnnotationId = sea.SourceAnnotationId

-- select source location subset entries
SELECT st.SourceTypeId,
       s.SourceId,
       sl.SourceLocationId,
       sls.SourceLocationSubsetId,
       slse.SourceLocationSubsetEntryId,
       st.SourceTypeValue,
       s.SourceAuthor,
       s.SourceDirector,
       s.SourceTitle,
       s.SourceYear,
       s.SourceUrl,
       s.SourceRetrievalDate,
       s.SourceTag,
       sl.SourceLocationValue,
       sls.SourceLocationSubsetValue,
       slse.SourceLocationSubsetEntryValue,
       slse.SourceLocationSubsetEntryVerifiedPresentAt,
       slse.SourceLocationSubsetEntryVerifiedMissingAt
FROM Source s
JOIN SourceType st
ON s.SourceTypeId = st.SourceTypeId
JOIN SourceLocationSubsetEntry slse
ON s.SourceId = slse.SourceId
JOIN SourceLocationSubset sls
ON slse.SourceLocationSubsetId = sls.SourceLocationSubsetId
JOIN SourceLocation sl 
ON sl.SourceLocationId = sls.SourceLocationId

-- select source excerpt tags
SELECT st.SourceTypeId,
       s.SourceId,
       se.SourceExcerptId,
       sext.SourceExcerptTaggingId,
       mt.MediaTagId,
       st.SourceTypeValue,
       s.SourceAuthor,
       s.SourceDirector,
       s.SourceTitle,
       s.SourceYear,
       s.SourceUrl,
       s.SourceRetrievalDate,
       s.SourceTag,
       se.SourceExcerptValue,
       se.SourceExcerptPages,
       se.SourceExcerptBeginTime,
       se.SourceExcerptEndTime,
       sext.SourceExcerptTaggingTaggedAt,
       sext.SourceExcerptTaggingUntaggedAt,
       mt.MediaTagValue
FROM Source s
JOIN SourceType st
ON s.SourceTypeId = st.SourceTypeId
JOIN SourceExcerpt se
ON s.SourceId = se.SourceId
JOIN SourceExcerptTagging sext
ON se.SourceExcerptId = sext.SourceExcerptId
JOIN MediaTag mt
ON sext.MediaTagId = mt.MediaTagId
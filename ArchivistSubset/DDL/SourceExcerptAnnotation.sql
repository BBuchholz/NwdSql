-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceExcerptAnnotation (
	SourceExcerptAnnotationId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceExcerptId INTEGER NOT NULL REFERENCES SourceExcerpt (SourceExcerptId), 
	SourceAnnotationId INTEGER NOT NULL REFERENCES SourceAnnotation (SourceAnnotationId),
	SourceExcerptAnnotationLinkedAt TEXT,
	SourceExcerptAnnotationUnlinkedAt TEXT,
	SourceExcerptAnnotationCreatedAt TEXT,
	SourceExcerptAnnotationUpdatedAt TEXT, 
	UNIQUE(SourceExcerptId, SourceAnnotationId)
)

-- updated at trigger
CREATE TRIGGER SetSourceExcerptAnnotationUpdatedAt
AFTER UPDATE ON SourceExcerptAnnotation
BEGIN
UPDATE SourceExcerptAnnotation 
	SET SourceExcerptAnnotationUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceExcerptAnnotation.SourceExcerptAnnotationId = NEW.SourceExcerptAnnotationId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceExcerptAnnotationCreatedAt 
AFTER INSERT ON SourceExcerptAnnotation
BEGIN
UPDATE SourceExcerptAnnotation 
	SET SourceExcerptAnnotationCreatedAt = CURRENT_TIMESTAMP, 
		   SourceExcerptAnnotationUpdatedAt = CURRENT_TIMESTAMP,
		   SourceExcerptAnnotationLinkedAt = CURRENT_TIMESTAMP
	WHERE SourceExcerptAnnotation.SourceExcerptAnnotationId = NEW.SourceExcerptAnnotationId;
END
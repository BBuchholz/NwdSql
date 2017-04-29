-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceAnnotation (
	SourceAnnotationId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceAnnotationValue TEXT NOT NULL UNIQUE,
	SourceAnnotationCreatedAt TEXT,
	SourceAnnotationUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSourceAnnotationUpdatedAt
AFTER UPDATE ON SourceAnnotation
BEGIN
UPDATE SourceAnnotation 
	SET SourceAnnotationUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceAnnotation.SourceAnnotationId = NEW.SourceAnnotationId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceAnnotationCreatedAt 
AFTER INSERT ON SourceAnnotation
BEGIN
UPDATE SourceAnnotation 
	SET SourceAnnotationCreatedAt = CURRENT_TIMESTAMP, 
		   SourceAnnotationUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceAnnotation.SourceAnnotationId = NEW.SourceAnnotationId;
END
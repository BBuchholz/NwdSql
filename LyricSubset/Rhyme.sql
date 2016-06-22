-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Rhyme (
	RhymeId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	RhymeGroupId INTEGER NOT NULL REFERENCES RhymeGroup(RhymeGroupId), 
	WordPhraseId INTEGER NOT NULL REFERENCES WordPhrase(WordPhraseId), 
	RhymeCreatedAt TEXT NOT NULL, 
	RhymeUpdatedAt TEXT NOT NULL,
	UNIQUE(RhymeGroupId, WordPhraseId)  
)

-- updated at trigger
CREATE TRIGGER SetRhymeUpdatedAt
AFTER UPDATE ON Rhyme
BEGIN
UPDATE Rhyme 
	SET RhymeUpdatedAt = CURRENT_TIMESTAMP
	WHERE Rhyme.RhymeId = NEW.RhymeId;
END

-- created at & updated at trigger
CREATE TRIGGER SetRhymeCreatedAt 
AFTER INSERT ON Rhyme
BEGIN
UPDATE Rhyme 
	SET RhymeCreatedAt = CURRENT_TIMESTAMP, 
		   RhymeUpdatedAt = CURRENT_TIMESTAMP
	WHERE Rhyme.RhymeId = NEW.RhymeId;
END
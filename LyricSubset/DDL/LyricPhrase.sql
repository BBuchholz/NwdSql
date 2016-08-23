-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE LyricPhrase (
	LyricPhraseId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	LyricBitId INTEGER NOT NULL REFERENCES LyricBit(LyricBitId), 
	WordPhraseId INTEGER NOT NULL REFERENCES WordPhrase(WordPhraseId), 
	LyricPhraseCreatedAt TEXT, 
	LyricPhraseUpdatedAt TEXT,
	UNIQUE(LyricBitId, WordPhraseId)  
) 

-- updated at trigger
CREATE TRIGGER SetLyricPhraseUpdatedAt
AFTER UPDATE ON LyricPhrase
BEGIN
UPDATE LyricPhrase 
	SET LyricPhraseUpdatedAt = CURRENT_TIMESTAMP
	WHERE LyricPhrase.LyricPhraseId = NEW.LyricPhraseId;
END

-- created at & updated at trigger
CREATE TRIGGER SetLyricPhraseCreatedAt 
AFTER INSERT ON LyricPhrase
BEGIN
UPDATE LyricPhrase 
	SET LyricPhraseCreatedAt = CURRENT_TIMESTAMP, 
		   LyricPhraseUpdatedAt = CURRENT_TIMESTAMP
	WHERE LyricPhrase.LyricPhraseId = NEW.LyricPhraseId;
END
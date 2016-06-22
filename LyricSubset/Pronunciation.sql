-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Pronunciation (
	PronunciationId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	ArpaBetWordId INTEGER NOT NULL REFERENCES ArpaBetWord(ArpaBetWordId), 
	WordPhraseId INTEGER NOT NULL REFERENCES WordPhrase(WordPhraseId), 
	PronunciationCreatedAt TEXT NOT NULL, 
	PronunciationUpdatedAt TEXT NOT NULL,
	UNIQUE(ArpaBetWordId, WordPhraseId) 
)

-- updated at trigger
CREATE TRIGGER SetPronunciationUpdatedAt
AFTER UPDATE ON Pronunciation
BEGIN
UPDATE Pronunciation 
	SET PronunciationUpdatedAt = CURRENT_TIMESTAMP
	WHERE Pronunciation.PronunciationId = NEW.PronunciationId;
END

-- created at & updated at trigger
CREATE TRIGGER SetPronunciationCreatedAt 
AFTER INSERT ON Pronunciation
BEGIN
UPDATE Pronunciation 
	SET PronunciationCreatedAt = CURRENT_TIMESTAMP, 
		   PronunciationUpdatedAt = CURRENT_TIMESTAMP
	WHERE Pronunciation.PronunciationId = NEW.PronunciationId;
END
-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE WordPhrase (
	WordPhraseId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	WordPhraseValue TEXT NOT NULL UNIQUE,
	WordPhraseCreatedAt TEXT,
	WordPhraseUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetWordPhraseUpdatedAt
AFTER UPDATE ON WordPhrase
BEGIN
UPDATE WordPhrase 
	SET WordPhraseUpdatedAt = CURRENT_TIMESTAMP
	WHERE WordPhrase.WordPhraseId = NEW.WordPhraseId;
END

-- created at & updated at trigger
CREATE TRIGGER SetWordPhraseCreatedAt 
AFTER INSERT ON WordPhrase
BEGIN
UPDATE WordPhrase 
	SET WordPhraseCreatedAt = CURRENT_TIMESTAMP, 
		   WordPhraseUpdatedAt = CURRENT_TIMESTAMP
	WHERE WordPhrase.WordPhraseId = NEW.WordPhraseId;
END
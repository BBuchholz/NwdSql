-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE ArpaBetWord (
	ArpaBetWordId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	ArpaBetWordValue TEXT NOT NULL UNIQUE,
	ArpaBetWordCreatedAt TEXT,
	ArpaBetWordUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetArpaBetWordUpdatedAt
AFTER UPDATE ON ArpaBetWord
BEGIN
UPDATE ArpaBetWord 
	SET ArpaBetWordUpdatedAt = CURRENT_TIMESTAMP
	WHERE ArpaBetWord.ArpaBetWordId = NEW.ArpaBetWordId;
END

-- created at & updated at trigger
CREATE TRIGGER SetArpaBetWordCreatedAt 
AFTER INSERT ON ArpaBetWord
BEGIN
UPDATE ArpaBetWord 
	SET ArpaBetWordCreatedAt = CURRENT_TIMESTAMP, 
		   ArpaBetWordUpdatedAt = CURRENT_TIMESTAMP
	WHERE ArpaBetWord.ArpaBetWordId = NEW.ArpaBetWordId;
END
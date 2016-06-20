CREATE TRIGGER SetArpaBetWordUpdatedAt
AFTER UPDATE ON ArpaBetWord
BEGIN
UPDATE ArpaBetWord 
	SET UpdatedAt = CURRENT_TIMESTAMP
	WHERE ArpaBetWord.ArpaBetWordId = NEW.ArpaBetWordId;
END
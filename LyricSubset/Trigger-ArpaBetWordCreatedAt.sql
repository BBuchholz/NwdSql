CREATE TRIGGER SetArpaBetWordCreatedAndUpdatedAt 
AFTER INSERT ON ArpaBetWord
BEGIN
UPDATE ArpaBetWord 
	SET CreatedAt = CURRENT_TIMESTAMP, 
		   UpdatedAt = CURRENT_TIMESTAMP
	WHERE ArpaBetWord.ArpaBetWordId = NEW.ArpaBetWordId;
END
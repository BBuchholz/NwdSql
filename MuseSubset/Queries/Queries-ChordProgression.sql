-- STUDIO_V5_INSERT_CHORD_PROGRESSION_SIGNATURE_NOTES_X_Y
INSERT OR IGNORE INTO ChordProgression 
	(ChordProgressionSignature,
	 ChordProgressionNotes)
VALUES
	(?, ?) ;

-- Signature is UNIQUE, and once in we don't wanna change it, so keyed on sig.
-- STUDIO_V5_UPDATE_CHORD_PROGRESSION_NOTES_BY_SIGNATURE_X_Y
UPDATE ChordProgression
SET ChordProgressionNotes = ?
WHERE ChordProgressionSignature = ? ;

-- STUDIO_V5_SELECT_ALL_CHORD_PROGRESSIONS_ID_SIGNATURE_NOTES
SELECT ChordProgressionId,
	   ChordProgressionSignature,
	   ChordProgressionNotes
FROM ChordProgression ;

-- STUDIO_V5_SELECT_CHORD_PROGRESSION_BY_SIGNATURE_X
SELECT ChordProgressionId,
	   ChordProgressionSignature,
	   ChordProgressionNotes
FROM ChordProgression
WHERE ChordProgressionSignature = ? ;

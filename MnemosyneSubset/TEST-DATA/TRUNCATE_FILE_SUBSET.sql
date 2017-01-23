-- sqlite doesn't have a TRUNCATE statement proper
-- so we simply do a DELETE on each table in the 
-- FILE SUBSET without a WHERE clause

DELETE FROM DisplayName;  
DELETE FROM Path; 
DELETE FROM Hash;   
DELETE FROM Device;  
DELETE FROM File;   
DELETE FROM Tag;    
DELETE FROM FileTag;
DELETE FROM FileHash; 
DELETE FROM AudioTranscript;    
DELETE FROM LocalConfig;   
DELETE FROM Transcription;
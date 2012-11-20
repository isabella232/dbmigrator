CREATE OR REPLACE FUNCTION DeleteAll(
	) RETURNS INTEGER AS $$
BEGIN
	TRUNCATE TABLE Markers;
	TRUNCATE TABLE Tags;
	TRUNCATE TABLE ItemRelations;
	TRUNCATE TABLE ItemExceptions;
	TRUNCATE TABLE Items;
	TRUNCATE TABLE IdentityMarkers, UserMarkers;
	TRUNCATE TABLE IdentityStates, UserStates;
	TRUNCATE TABLE IdentityRoles, UserRoles;
	RETURN 0;
END;
$$ LANGUAGE PLPGSQL
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION DeleteAll() TO PUBLIC; 
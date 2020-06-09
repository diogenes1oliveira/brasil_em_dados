DELIMITER $$
CREATE FUNCTION UUID_OPTIMIZED(uuid_str VARCHAR(36))
	RETURNS BINARY(16) DETERMINISTIC
    COMMENT 'Returns an optimized binary version of the UUID-formatted string'
BEGIN
	DECLARE uuid_bin BINARY(16);
    SET uuid_bin = UNHEX(REPLACE(uuid_str, '-', ''));
    RETURN CONCAT(
		SUBSTR(uuid_bin, 7, 2),
		SUBSTR(uuid_bin, 5, 2),
        SUBSTR(uuid_bin, 1, 4),
        SUBSTR(uuid_bin, 9, 8));
END$$
DELIMITER ;

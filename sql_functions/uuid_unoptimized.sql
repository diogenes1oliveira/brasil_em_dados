DELIMITER $$
CREATE FUNCTION UUID_UNOPTIMIZED(the_uuid BINARY(16))
	RETURNS VARCHAR(36) DETERMINISTIC
    COMMENT 'Decodes the optimized binary UUID into a formatted UUID string.'
BEGIN
	DECLARE uuid_bin BINARY(16);
    SET uuid_bin = CONCAT(
		SUBSTR(the_uuid, 5, 4),
		SUBSTR(the_uuid, 3, 2),
        SUBSTR(the_uuid, 1, 2),
        SUBSTR(the_uuid, 9, 8));
	RETURN LOWER(CONCAT(
		SUBSTR(HEX(uuid_bin), 1, 8), '-',
		SUBSTR(HEX(uuid_bin), 9, 4), '-',
		SUBSTR(HEX(uuid_bin), 13, 4), '-',
		SUBSTR(HEX(uuid_bin), 17, 4), '-',
		SUBSTR(HEX(uuid_bin), 21)
	  ));
END$$
DELIMITER ;

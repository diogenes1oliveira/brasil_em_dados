DELIMITER $$
CREATE FUNCTION UUID_OPTIMIZE(uuid_bin BINARY(16))
	RETURNS BINARY(16) DETERMINISTIC
    COMMENT 'Returns an optimized version of the binary UUID'
BEGIN
    RETURN CONCAT(
		SUBSTR(uuid_bin, 7, 2),
		SUBSTR(uuid_bin, 5, 2),
        SUBSTR(uuid_bin, 1, 4),
        SUBSTR(uuid_bin, 9, 8));
END$$
DELIMITER ;

CREATE TRIGGER geo_divisions_insert BEFORE INSERT ON geo_divisions
FOR EACH ROW
BEGIN
	DELETE FROM geo_divisions;
END
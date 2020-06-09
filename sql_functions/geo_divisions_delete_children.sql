CREATE TRIGGER geo_divisions_delete_children AFTER DELETE ON geo_divisions
FOR EACH ROW
BEGIN
	DELETE FROM geo_divisions;
END
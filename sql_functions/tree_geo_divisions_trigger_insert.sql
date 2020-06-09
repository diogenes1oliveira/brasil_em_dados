DELIMITER $$
CREATE TRIGGER tree_geo_divisions_insertion BEFORE INSERT ON tree_geo_divisions
FOR EACH ROW
BEGIN
	IF NEW.ancestor_depth = -1 THEN
		SET NEW.ancestor_depth = (
			SELECT MAX(ancestor_depth) + 1 WHERE node = NEW.ancestor
		);
        INSERT INTO tree_geo_divisions
			(node, ancestor, ancestor_depth)
		SELECT
			NEW.node, ancestor, ancestor_depth
		FROM
			tree_geo_divisions
		WHERE
			node = NEW.ancestor;
    END IF;
END
DELIMITER ;
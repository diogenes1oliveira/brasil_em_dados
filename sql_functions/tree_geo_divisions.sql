CREATE TABLE tree_geo_divisions (
	id INT NOT NULL AUTO_INCREMENT,
    node BINARY(16) NOT NULL,
    ancestor BINARY(16) NOT NULL,
    ancestor_depth INT NOT NULL DEFAULT -1 COMMENT 'Update with triggers',
    
    PRIMARY KEY(id),
    FOREIGN KEY (node) REFERENCES geo_divisions(id)
		ON DELETE CASCADE,
    FOREIGN KEY (ancestor) REFERENCES geo_divisions(id)
		ON DELETE CASCADE,
	
    INDEX(ancestor), INDEX(ancestor_depth),
    INDEX(ancestor, ancestor_depth), INDEX(node, ancestor_depth),
    UNIQUE INDEX(node, ancestor, ancestor_depth)
    
);

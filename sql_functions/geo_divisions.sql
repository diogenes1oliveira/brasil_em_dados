CREATE TABLE geo_divisions (
	id BINARY(16) NOT NULL,
    code VARCHAR(20) NOT NULL,
    type VARCHAR(20) NOT NULL,
    name VARCHAR(150) NOT NULL,
    initials VARCHAR(5) NOT NULL DEFAULT '',
    
    id_str VARCHAR(36) GENERATED ALWAYS AS (
		INSERT(
			INSERT(
				INSERT(
					INSERT(LOWER(HEX(id)),9,0,'-'),
				14,0,'-'),
			19,0,'-'),
		24,0,'-')
    ) VIRTUAL,
    
    PRIMARY KEY(id),
	INDEX(name), INDEX(code), INDEX(type), INDEX(initials)
)




DROP SERVER server_pgpool CASCADE;


CREATE SERVER server_pgpool
    FOREIGN DATA WRAPPER buscador_wrapper
    OPTIONS (dbname 'buscador', host 'dockerswarm.sigisweb.net', port '9999');

ALTER SERVER server_pgpool
    OWNER TO postgres;
GRANT USAGE ON FOREIGN SERVER server_pgpool TO postgres;
GRANT USAGE ON FOREIGN SERVER server_pgpool TO u_gtr_lite;

CREATE USER MAPPING FOR u_gtr_lite SERVER server_pgpool OPTIONS (user 'u_buscador' , password 'u_buscador01*.,');
CREATE USER MAPPING FOR postgres   SERVER server_pgpool OPTIONS (user 'u_buscador' , password 'u_buscador01*.,');

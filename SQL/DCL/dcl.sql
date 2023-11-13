CREATE USER "siscope-main" wiTH PASSWORD '515c0p3';

GRANT USAGE ON SCHEMA public TO "siscope-main";

CREATE USER "siscope-tarifario" wiTH PASSWORD '515c0p3';

GRANT USAGE ON SCHEMA public TO "siscope-tarifario";

CREATE USER "siscope-dev" wiTH PASSWORD 'Niwde123$';

GRANT USAGE ON SCHEMA public TO "siscope-dev";

DO $$ 
DECLARE 
    current_table text;
BEGIN 
    FOR current_table IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE') 
    LOOP 
        EXECUTE 'GRANT SELECT, INSERT, UPDATE ON TABLE ' || current_table || ' TO "siscope-main";';
    END LOOP;
END $$;

DO $$ 
DECLARE 
    current_table text;
BEGIN 
    FOR current_table IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE') 
    LOOP 
        EXECUTE 'GRANT SELECT, INSERT, UPDATE ON TABLE ' || current_table || ' TO "siscope-tarifario";';
    END LOOP;
END $$;

DO $$ 
DECLARE 
    current_table text;
BEGIN 
    FOR current_table IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE') 
    LOOP 
        EXECUTE 'GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE ' || current_table || ' TO "siscope-dev";';
    END LOOP;
END $$;


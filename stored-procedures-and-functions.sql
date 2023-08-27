-- SQL -> non-procedural (declarative language) -> what to do
-- C,C++, Java  imperative language -> how to do
-- Functions -> return
-- Stored procedure -> no return, transaction
-- Stored procedure 
CREATE PROCEDURE deactivate_unpaid_accounts() LANGUAGE SQL AS $$ -- start
UPDATE account
SET account = FALSE
WHERE balance = 0;
$$;
-- end
CALL deactivate_unpaid_accounts();
-- functions
CREATE FUNCTION account_type_count(account_type TEXT) RETURNS INTEGER LANGUAGE plpgsql AS $$ -- start
DECLARE account_count INT;
-- variable
BEGIN -- starting transection
SELECT count(*) INTO account_count
from account
WHERE account.account_type = $1;
RETURN account_count;
END;
$$;
-- end
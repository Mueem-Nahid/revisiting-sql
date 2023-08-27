CREATE TABLE products (
   id SERIAL PRIMARY KEY,
   title VARCHAR(50) NOT NULL,
   base_price FLOAT8 NOT NULL,
   final_price FLOAT8
);
INSERT INTO products (title, base_price)
VALUES ('Laptop', 800.0),
   ('Smartphone', 500.0),
   ('Headphones', 100.0),
   ('Camera', 600.0),
   ('Tablet', 300.0),
   ('Television', 1000.0),
   ('Fitness Tracker', 50.0),
   ('Gaming Console', 400.0),
   ('Coffee Maker', 80.0),
   ('Bluetooth Speaker', 70.0),
   ('Microwave Oven', 150.0),
   ('Refrigerator', 800.0),
   ('Vacuum Cleaner', 200.0),
   ('Washing Machine', 450.0),
   ('Toaster', 30.0),
   ('Blender', 60.0),
   ('Smart Watch', 120.0),
   ('Printer', 100.0),
   ('Projector', 300.0),
   ('Air Purifier', 90.0);
-- function
CREATE OR REPLACE FUNCTION update_final_price() RETURNS TRIGGER LANGUAGE plpgsql AS $$ BEGIN -- new, old keyword
   NEW.final_price := NEW.base_price * 1.05;
RETURN NEW;
END;
$$;
-- trigger (insert/update/delete)
CREATE OR REPLACE TRIGGER add_tax_trigger
AFTER
INSERT ON products FOR EACH ROW EXECUTE FUNCTION update_final_price();
SELECT *
FROM products;
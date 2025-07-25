CREATE DATABASE warehouse_mgmt;
USE warehouse_mgmt;

-- Create Tables
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_name VARCHAR(100) NOT NULL,
    location VARCHAR(200),
    capacity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    supplier_id INT,
    unit_price DECIMAL(10,2),
    reorder_level INT DEFAULT 10,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    warehouse_id INT,
    quantity INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO suppliers (supplier_name, contact_person, phone, email) VALUES
('Rodriguez, Figueroa and Sanchez', 'Brian Yang', '+1-196-001-3389', 'jennifermiles@robinson-lawrence.com'),
('Wolfe LLC', 'Daniel Gallagher', '161-559-4078', 'smiller@montgomery.com'),
('Gibson and Sons', 'Paul Lewis', '417.430.7837', 'susanperez@steele.org'),
('Wheeler and Sons', 'Jonathan Ho', '453.949.2667', 'kelseyjohnson@campbell.net'),
('Martin, Adams and Salinas', 'Joseph Robbins', '681-953-5789', 'teresajohnson@burke.com'),
('Roberts, Wood and Burke', 'Kayla Johnson', '001-385-772-1406', 'cameronbrooks@brown.com'),
('Hernandez PLC', 'Brianna Wilkins', '+1-800-912-5947', 'graykelly@patel.com'),
('Williamson-Smith', 'Edward Williams', '693.305.3247', 'lawrencerogers@howard.biz'),
('Buchanan PLC', 'Amber Bryant', '(891)296-3896', 'jennifermiller@phillips.biz'),
('Boyd LLC', 'James Robbins', '814-493-9407', 'zacharyedwards@lewis.biz');

INSERT INTO warehouses (warehouse_name, location, capacity) VALUES
('Bernard, Cowan and Peters Warehouse', '43098 Julie Centers\nNew Thomashaven, AR 67063', 2824),
('York Inc Warehouse', '1939 Christine Manor\nSarahborough, VT 41681', 1409),
('Campbell-Wilson Warehouse', '13965 Erica Forge Apt. 755\nAndersonmouth, ID 35586', 9088),
('Russell PLC Warehouse', '1253 Susan Stream Apt. 386\nNorth Brittany, IL 30017', 3549),
('Lewis, Cooper and Barry Warehouse', '1714 Emily Trail Apt. 070\nFisherland, ME 16838', 3652);

INSERT INTO products (product_name, description, supplier_id, unit_price, reorder_level) VALUES
('Offer Product', 'Strong old challenge.', 3, 370.87, 7),
('Care Product', 'Final together someone.', 10, 216.74, 5),
('Face Product', 'Describe nature wait much.', 9, 31.43, 19),
('Vote Product', 'See explain easy.', 6, 232.70, 12),
('Short Product', 'Alone surface few cost.', 6, 104.95, 19),
('Long Product', 'Beyond prove fire statement.', 2, 339.62, 17),
('Fast Product', 'Region various today clearly.', 1, 161.82, 8),
('Fresh Product', 'Office stay property wide.', 7, 284.36, 7),
('Top Product', 'Either support accept someone.', 5, 176.32, 11),
('Open Product', 'Movement week quality far.', 9, 67.40, 8),
('New Product', 'Could something perhaps.', 3, 143.11, 16),
('Free Product', 'Strategy pattern local.', 5, 110.04, 7),
('Best Product', 'Fly across kind.', 6, 392.30, 19),
('Blue Product', 'Assume many strong.', 7, 64.55, 19),
('Great Product', 'Check fish plan.', 1, 26.67, 15),
('Calm Product', 'Difficult career stuff.', 9, 129.79, 7),
('Real Product', 'Tree shoulder same.', 2, 13.90, 10),
('Nice Product', 'Fund behavior color.', 8, 181.89, 14),
('Cool Product', 'Democratic free across.', 7, 354.14, 7),
('Pure Product', 'Spring check process.', 8, 473.00, 14),
('Warm Product', 'Call character moment.', 5, 313.82, 7),
('High Product', 'Movie peace follow.', 4, 270.69, 14),
('Big Product', 'Soon system significant.', 6, 313.91, 19),
('Good Product', 'Reduce single institution.', 2, 351.59, 11),
('Kind Product', 'During race task.', 10, 306.34, 12),
('Dry Product', 'Score firm significant.', 1, 393.86, 18),
('Easy Product', 'Wonder management agreement.', 8, 222.57, 11),
('Hot Product', 'Attack large commercial.', 4, 216.78, 8),
('Loud Product', 'Spend operation catch.', 9, 206.14, 18),
('Calm Product', 'Course black field.', 10, 158.44, 15);

INSERT INTO inventory (product_id, warehouse_id, quantity) VALUES
(17, 4, 23), (25, 1, 28), (5, 2, 174), (14, 5, 16), (13, 4, 152),
(12, 5, 144), (3, 1, 163), (1, 4, 180), (22, 3, 17), (28, 4, 160),
(24, 3, 138), (30, 2, 51), (6, 5, 6), (21, 1, 67), (26, 4, 164),
(18, 5, 70), (27, 3, 85), (4, 1, 59), (23, 2, 146), (15, 1, 101),
(7, 4, 147), (9, 2, 179), (2, 5, 145), (10, 3, 45), (16, 2, 64),
(8, 4, 153), (20, 1, 184), (19, 2, 149), (11, 5, 140), (29, 3, 182),
(13, 4, 25), (6, 2, 122), (5, 5, 190), (14, 3, 134), (1, 2, 30),
(12, 1, 74), (18, 4, 173), (20, 5, 107), (3, 3, 154), (7, 2, 108),
(17, 1, 155), (28, 5, 49), (22, 2, 50), (9, 3, 84), (27, 1, 79),
(4, 5, 83), (24, 2, 188), (26, 3, 31), (30, 4, 191), (19, 1, 192),
(16, 5, 100), (8, 1, 106), (21, 3, 18), (2, 2, 102), (10, 4, 67),
(25, 3, 104), (11, 1, 94), (23, 5, 136), (29, 4, 142), (15, 2, 190),
(7, 5, 23), (14, 1, 114), (5, 4, 194), (12, 3, 66), (6, 1, 21),
(17, 2, 82), (3, 5, 62), (13, 1, 133), (1, 5, 86), (19, 4, 74),
(27, 2, 142), (20, 3, 12), (9, 1, 133), (18, 2, 96), (4, 3, 132),
(10, 1, 50), (8, 2, 158), (28, 3, 91), (30, 5, 173), (22, 1, 92),
(29, 2, 198), (16, 4, 111), (24, 1, 178), (2, 3, 156), (6, 4, 103),
(25, 5, 56), (11, 4, 177), (26, 1, 143), (21, 5, 125), (23, 1, 43),
(15, 3, 145), (14, 2, 126), (13, 5, 169), (7, 3, 30), (17, 5, 181),
(3, 2, 47), (19, 5, 68), (12, 2, 72), (5, 1, 190), (9, 5, 87),
(18, 3, 171), (27, 5, 94), (20, 2, 165), (10, 5, 109);

-- 3. Queries to Check Stock Levels and Reorder Alerts

-- a. Current stock levels by product and warehouse
SELECT p.product_name, w.warehouse_name, i.quantity
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id;

-- b. Products below reorder level
SELECT p.product_id, p.product_name, SUM(i.quantity) AS total_quantity, p.reorder_level
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name, p.reorder_level
HAVING total_quantity < p.reorder_level;

-- 4. Trigger for Low-Stock Notification
DELIMITER //
CREATE TRIGGER trg_low_stock_alert
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    DECLARE total_qty INT;
    SELECT SUM(quantity) INTO total_qty FROM inventory WHERE product_id = NEW.product_id;
    IF total_qty < (SELECT reorder_level FROM products WHERE product_id = NEW.product_id) THEN
        INSERT INTO low_stock_alerts(product_id, alert_time)
        VALUES (NEW.product_id, NOW());
    END IF;
END;//
DELIMITER ;

-- (Create supporting table)
CREATE TABLE low_stock_alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    alert_time TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 5. Stored Procedure to Transfer Stock Between Warehouses
DELIMITER //
CREATE PROCEDURE transfer_stock (
    IN prod_id INT,
    IN from_wh INT,
    IN to_wh INT,
    IN qty INT
)
BEGIN
    DECLARE from_qty INT;

    SELECT quantity INTO from_qty FROM inventory
    WHERE product_id = prod_id AND warehouse_id = from_wh;

    IF from_qty >= qty THEN
        -- Decrease from source warehouse
        UPDATE inventory SET quantity = quantity - qty
        WHERE product_id = prod_id AND warehouse_id = from_wh;

        -- Increase in target warehouse
        INSERT INTO inventory (product_id, warehouse_id, quantity)
        VALUES (prod_id, to_wh, qty)
        ON DUPLICATE KEY UPDATE quantity = quantity + qty;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not enough stock in source warehouse';
    END IF;
END;//
DELIMITER ;

CALL transfer_stock(5, 2, 3, 20);






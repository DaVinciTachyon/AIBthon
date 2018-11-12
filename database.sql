DROP TABLE IF EXISTS codes;

CREATE TABLE codes(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(100) NOT NULL,
  item_id INT UNSIGNED NOT NULL
);

DROP TABLE IF EXISTS deals;

CREATE TABLE deals(
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  item VARCHAR(100) NOT NULL,
  price FLOAT NOT NULL,
  location VARCHAR(200) NOT NULL,
  website VARCHAR(200),
  description VARCHAR(1000)
);

INSERT INTO codes(code, item_id) VALUES ("hello world man", 1);
INSERT INTO codes(code, item_id) VALUES ("help bottle chip", 2);
INSERT INTO codes(code, item_id) VALUES ("blue building football", 3);
INSERT INTO codes(code, item_id) VALUES ("no chicken rugby", 4);


INSERT INTO deals(item, price, location, description) VALUES ("groceries", 20, "Spar, Grand Canal Dock","Coupon to buy groceries at the local spar");
INSERT INTO deals(item, price, website, location, description) VALUES ("english training", 40, "englishtraining.com", "Grafton Street English facility","Coupon to attend english courses");
INSERT INTO deals(item, price, location, description) VALUES ("barber", 10, "Any grafton barber","Coupon for one session at the barber");
INSERT INTO deals(item, price, location, description) VALUES ("hostel", 15, "Liffey river hostel","Coupon to stay one night at the liffey river hostel");

ALTER TABLE codes ADD isAvailable tinyint(1) DEFAULT 1;

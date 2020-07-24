CREATE TABLE card_holder(
    id SERIAL,
    name VARCHAR(30) NOT NULL,
	PRIMARY KEY (id))
;

CREATE TABLE credit_card(
	card VARCHAR(20) NOT NULL,
	id_card_holder INT,
	PRIMARY KEY (card),
	FOREIGN KEY (id_card_holder) REFERENCES card_holder(id))
;

CREATE TABLE merchant_category(
	id SERIAL,
	name VARCHAR(30) NOT NULL,
	PRIMARY KEY (id))
;

CREATE TABLE merchant(
	id SERIAL,
	name VARCHAR(30) NOT NULL,
	id_merchant_category INT,
	PRIMARY KEY (id),
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id))
;

CREATE TABLE transaction(
	id SERIAL,
	date DATE,
	amount MONEY NOT NULL,
	card VARCHAR(20),
	id_merchant INT,
	PRIMARY KEY (id),
	FOREIGN KEY (card) REFERENCES credit_card(card),
	FOREIGN KEY (id_merchant) REFERENCES merchant(id))
;
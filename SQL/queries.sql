-- grouping transactions of each cardholder
CREATE VIEW transactions_by_cardholder AS
	SELECT card_holder.id AS ch_id, card_holder.name, credit_card.card, transaction.id AS t_id, transaction.date::date AS date, transaction.amount
	FROM card_holder, transaction, credit_card
	WHERE transaction.card = credit_card.card
	AND credit_card.id_card_holder = card_holder.id
	GROUP BY card_holder.id, card_holder.name, credit_card.card, transaction.id, transaction.date, transaction.amount
	ORDER BY card_holder.id ASC
	;
	
SELECT * FROM transactions_by_cardholder

-- look at the 100 highest transaction between 7am and 9am (2)
CREATE VIEW top_100_highest_trans_7am_9am AS
	SELECT id, date::date AS date, date::time(0) AS purchase_time, card, amount
	FROM transaction
	WHERE amount IN (SELECT amount
					FROM transaction
					WHERE date::time(0) BETWEEN '07:00:00' AND '09:00:00'
					ORDER BY amount DESC
					LIMIT 100
					)
	ORDER by card, date DESC
	;
	
SELECT * FROM top_100_highest_trans_7am_9am

-- get a count of the transactions that are less than $2.00 per cardholder
CREATE VIEW cardholder_trans_count_less_than_$2 AS
	SELECT card_holder.id AS ch_id, card_holder.name, credit_card.card, COUNT(amount) AS count_transactions_less_than_$2
	FROM card_holder, transaction, credit_card
	WHERE transaction.card = credit_card.card
	AND credit_card.id_card_holder = card_holder.id
	AND amount BETWEEN '$0.00' AND '$2.00'
	GROUP BY card_holder.id, card_holder.name, credit_card.card
	ORDER BY card_holder.id ASC
	;

SELECT * FROM cardholder_trans_count_less_than_$2

-- top 5 merchants prone to being hacked using small tranactions
CREATE VIEW small_trans_hack_prone_merchants AS
	SELECT merchant.id, merchant.name, COUNT(amount) AS transactions_smaller_than_$2
	FROM  transaction, merchant
	WHERE transaction.id_merchant = merchant.id
	AND transaction.amount BETWEEN '$0.00' AND '$2.00'
	GROUP BY merchant.id, merchant.name
	ORDER BY transactions_smaller_than_$2 DESC
	;

SELECT * FROM small_trans_hack_prone_merchants
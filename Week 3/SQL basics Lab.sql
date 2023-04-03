USE bank;

#QUERY 1: Get the id values of the first 5 clients from district_id with a value equal to 1.
#SELECT, SELECT DISTINCT, FROM, WHERE, ORDER BY, LIMIT

SELECT * FROM client;

SELECT district_id, client_id FROM client
WHERE district_id IN (1)
LIMIT 5;

#QUERY 2: In the client table, get an id value of the last client where the district_id is equal to 72.

SELECT * FROM client;

SELECT client_id FROM client
WHERE district_id IN (72)
ORDER BY client_id desc
LIMIT 1;

#QUERY 3: Get the 3 lowest amounts in the loan table.

SELECT * FROM loan;

SELECT amount FROM loan
ORDER BY amount asc
LIMIT 3;

#QUERY 4: What are the possible values for status,
#ordered alphabetically in ascending order in the loan table?

SELECT DISTINCT status FROM loan
ORDER BY status asc;

#QUERY 5: What is the loan_id of the highest payment received in the loan table?

SELECT payments, loan_id FROM loan
ORDER BY payments desc
LIMIT 1;

#QUERY 6: What is the loan amount of the lowest 5 account_ids in the loan table? 
#Show the account_id and the corresponding amount

SELECT * FROM loan;

SELECT account_id, amount FROM loan
ORDER BY account_id asc
LIMIT 5;

#QUERY 7: What are the top 5 account_ids with the lowest loan amount that have a
# loan duration of 60 in the loan table?

SELECT account_id FROM loan
WHERE duration IN (60)
ORDER BY amount asc
LIMIT 5;

#QUERY 8: What are the unique values of k_symbol in the order table? 
#Note: There shouldn't be a table name order,
#since order is reserved from the ORDER BY clause. 
#You have to use backticks to escape the order table name.

SELECT DISTINCT k_symbol FROM `order`;

#QUERY 9: In the order table, what are the order_ids of the client with the account_id 34?

SELECT order_id FROM `order`
WHERE account_id IN (34);

#QUERY 10: In the order table, which account_ids were responsible for 
#orders between order_id 29540 and order_id 29560 (inclusive)?

SELECT account_id, order_id FROM `order`
WHERE order_id BETWEEN 29540 AND 29560;

#QUERY 11: In the order table, what are the individual amounts that were sent to 
#(account_to) id 30067122?

SELECT amount FROM `order`
WHERE account_to = 30067122;

#QUERY 12: In the trans table, show the trans_id, date, type and amount of the 10 first transactions
#from account_id 793 in chronological order from newest to oldest.

SELECT trans_id, date, type, amount FROM trans
WHERE account_id = 793
ORDER BY date desc
LIMIT 10;

#OPTIONAL
#QUERY 13: In the client table, of all districts with a district_id lower than 10
#how many clients are from each district_id? Show the results sorted by the district_id in ascending order.

SELECT count(district_id) FROM client
WHERE district_id <10
GROUP BY district_id
ORDER BY district_id asc;

#QUERY 14: In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
SELECT * FROM card;

SELECT DISTINCT count(type), type FROM card
GROUP BY type;

CREATE TABLE tb_user(
	id INT AUTO_INCREMENT,
	username VARCHAR(20),
	age INT,
	create_date DATETIME,
	PRIMARY KEY(id)
);

INSERT INTO tb_user(username, age, create_date) VALUES('zk', 20, NOW());
INSERT INTO tb_user(username, age, create_date) VALUES('zq', 16, NOW());
INSERT INTO tb_user(username, age, create_date) VALUES('zy', 15, NOW());

SELECT * FROM tb_user;
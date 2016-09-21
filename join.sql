CREATE TABLE TB_A (
id   number PRIMARY KEY,
name  VARCHAR2(10)
);
drop table tb_b;
CREATE TABLE TB_B (
id   number,
name  VARCHAR2(10)
);

INSERT INTO TB_A VALUES(1,'A');
INSERT INTO TB_A VALUES(2,'B');
INSERT INTO TB_A VALUES(3,'C');
INSERT INTO TB_A VALUES(4,'D');
INSERT INTO TB_A VALUES(5,'E');

INSERT INTO TB_B VALUES(1,'1AA');
INSERT INTO TB_B VALUES(1,'1BB');
INSERT INTO TB_B VALUES(2,'2CC');
INSERT INTO TB_B VALUES(1,'1DD');
INSERT INTO TB_B VALUES(9,'999');

-- 以A表为基础表，匹配B表,B表没有则显示空
select * 
from scott.tb_a a
left join scott.tb_b b on a.id=b.id
order by a.id

-- + 表示补充，即哪个表有加号，这个表就是匹配表
select * 
from scott.tb_a a,scott.tb_b b
where a.id = b.id(+)

-- 以A表为基础表，匹配B表,B表必须有数据
select * 
from tb_a a
inner join tb_b b on a.id=b.id
order by a.id

-- right join 转化为left join看
select * 
from tb_a a
right join tb_b b on a.id=b.id
order by a.id
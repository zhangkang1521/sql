 SELECT NVL(COUNT(*), 0) AS TOTAL
 FROM XXD_BORROW B
 WHERE b.content IN ('sevengold','七天大胜');

SELECT bt.EFFECTIVEMONEY,
             bt.ADDTIME,
             u.nickname AS USERNAME
      FROM xxd_borrow_tender bt
      INNER JOIN XXD_BORROW B ON BT.BORROWID=B.BORROWID
      INNER JOIN XXD_USER U ON BT.USERID=U.USERID
      WHERE B.CONTENT IN('sevengold','七天大胜')
      ORDER BY ADDTIME DESC;
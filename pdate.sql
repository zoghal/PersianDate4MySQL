
-- ----------------------------
-- Function structure for `__mydiv`
-- ----------------------------
DROP FUNCTION IF EXISTS `__mydiv`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `__mydiv`(`a` int,`b` int) RETURNS int(11)
BEGIN

# Copyright (C) 2009  Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0
 return FLOOR( a / b);
END;;
DELIMITER ;

-- ----------------------------
-- Function structure for `_gdmarray`
-- ----------------------------
DROP FUNCTION IF EXISTS `_gdmarray`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_gdmarray`(`m` smallint) RETURNS smallint(2)
BEGIN
# Copyright (C) 2009  Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0

	CASE m
		WHEN 0 THEN RETURN 31;
		WHEN 1 THEN RETURN 28;
		WHEN 2 THEN RETURN 31;
		WHEN 3 THEN RETURN 30;
		WHEN 4 THEN RETURN 31;
		WHEN 5 THEN RETURN 30;
		WHEN 6 THEN RETURN 31;
		WHEN 7 THEN RETURN 31;
		WHEN 8 THEN RETURN 30;
		WHEN 9 THEN RETURN 31;
		WHEN 10 THEN RETURN 30;
		WHEN 11 THEN RETURN 31;
	END CASE;
   

END;;
DELIMITER ;

-- ----------------------------
-- Function structure for `_jdmarray`
-- ----------------------------
DROP FUNCTION IF EXISTS `_jdmarray`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_jdmarray`(`m` smallint) RETURNS smallint(2)
BEGIN
# Copyright (C) 2009  Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0

	CASE m
		WHEN 0 THEN RETURN 31;
		WHEN 1 THEN RETURN 31;
		WHEN 2 THEN RETURN 31;
		WHEN 3 THEN RETURN 31;
		WHEN 4 THEN RETURN 31;
		WHEN 5 THEN RETURN 31;
		WHEN 6 THEN RETURN 30;
		WHEN 7 THEN RETURN 30;
		WHEN 8 THEN RETURN 30;
		WHEN 9 THEN RETURN 30;
		WHEN 10 THEN RETURN 30;
		WHEN 11 THEN RETURN 29;
	END CASE;
   

END;;
DELIMITER ;

-- ----------------------------
-- Function structure for `pdate`
-- ----------------------------
DROP FUNCTION IF EXISTS `pdate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pdate`(`gdate` datetime) RETURNS char(100) CHARSET utf8
BEGIN
# Copyright (C) 2009  Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0

	DECLARE 
		i,
		gy, gm, gd,
		g_day_no,j_day_no, j_np,
		jy,jm,jd INT DEFAULT 0;
	DECLARE resout char(100);
	DECLARE ttime CHAR(20);

	SET gy = YEAR(gdate)-1600;
	SET gm = MONTH(gdate)-1;
	SET gd = DAY(gdate)-1;
	SET ttime = TIME(gdate);
	SET g_day_no = ((365 *  gy) + __mydiv( gy+3, 4 ) - __mydiv( gy+99 , 100 )+ __mydiv ( gy+399, 400 ) );
        SET i = 0;

	WHILE (i < gm) do
		SET  g_day_no = g_day_no + _gdmarray(i);
		SET i = i+1; 
	end WHILE;

	if  gm > 1 and (( gy% 4 = 0 and gy%100 <> 0 )) or gy % 400 = 0 THEN 
		SET 	g_day_no =	g_day_no +1;
	end IF;
	
	SET g_day_no = g_day_no + gd; 

	SET j_day_no = g_day_no -79;
	SET j_np =  j_day_no DIV 12053;
	set j_day_no = j_day_no % 12053;
	SET jy = 979 + 33 * j_np + 4 * __mydiv(j_day_no,1461);
	SET j_day_no = j_day_no % 1461;

	if j_day_no >= 366 then 
		SET jy = jy + __mydiv(j_day_no-1, 365);
		SET j_day_no =( j_day_no-1) % 365;
	end if;

	SET i = 0;

	WHILE ( i < 11 and j_day_no >= _jdmarray(i) ) do
		SET  j_day_no = j_day_no -  _jdmarray(i);
		SET i = i+1;
	end WHILE;

	SET jm = i+1;
	SET jd = j_day_no+1;
     	SET resout = CONCAT_WS ('-',jy,jm,jd);

	if (ttime <> '00:00:00' ) then
		SET resout = CONCAT_WS(' ',resout,ttime);
	END IF;
    
	RETURN  	resout;
END;;
DELIMITER ;

-- ----------------------------
-- Function structure for `PMONTH`
-- ----------------------------
DROP FUNCTION IF EXISTS `PMONTH`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `PMONTH`(`gdate` datetime) RETURNS char(100) CHARSET utf8
BEGIN
# Copyright (C) 2009  Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0

	DECLARE 
		i,
		gy, gm, gd,
		g_day_no,j_day_no, j_np,
		jy,jm,jd INT DEFAULT 0;
	DECLARE resout char(100);
	DECLARE ttime CHAR(20);

	SET gy = YEAR(gdate)-1600;
	SET gm = MONTH(gdate)-1;
	SET gd = DAY(gdate)-1;
	SET ttime = TIME(gdate);
	SET g_day_no = ((365 *  gy) + __mydiv( gy+3, 4 ) - __mydiv( gy+99 , 100 )+ __mydiv ( gy+399, 400 ) );
        SET i = 0;

	WHILE (i < gm) do
		SET  g_day_no = g_day_no + _gdmarray(i);
		SET i = i+1; 
	end WHILE;

	if  gm > 1 and (( gy% 4 = 0 and gy%100 <> 0 )) or gy % 400 = 0 THEN 
		SET 	g_day_no =	g_day_no +1;
	end IF;
	
	SET g_day_no = g_day_no + gd; 

	SET j_day_no = g_day_no -79;
	SET j_np =  j_day_no DIV 12053;
	set j_day_no = j_day_no % 12053;
	SET jy = 979 + 33 * j_np + 4 * __mydiv(j_day_no,1461);
	SET j_day_no = j_day_no % 1461;

	if j_day_no >= 366 then 
		SET jy = jy + __mydiv(j_day_no-1, 365);
		SET j_day_no =( j_day_no-1) % 365;
	end if;

	SET i = 0;

	WHILE ( i < 11 and j_day_no >= _jdmarray(i) ) do
		SET  j_day_no = j_day_no -  _jdmarray(i);
		SET i = i+1;
	end WHILE;

	SET jm = i+1;
	SET jd = j_day_no+1;
	RETURN  	jm;
END;;
DELIMITER ;

-- ----------------------------
-- Function structure for `pmonthname`
-- ----------------------------
DROP FUNCTION IF EXISTS `pmonthname`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pmonthname`(`gdate` datetime) RETURNS varchar(100) CHARSET utf8
BEGIN
# Copyright (C) 2009  Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0

CASE PMONTH(gdate) 
	WHEN 1 THEN 	RETURN '&#1601;&#1585;&#1608;&#1585;&#1583;&#1610;&#1606;';
	WHEN 2 THEN RETURN '&#1575;&#1585;&#1583;&#1610;&#1576;&#1607;&#1588;&#1578;';
	WHEN 3 THEN	RETURN '&#1582;&#1585;&#1583;&#1575;&#1583;';
	WHEN 4 THEN	RETURN '&#1578;&#1610;&#1585;';
	WHEN 5 THEN	RETURN '&#1605;&#1585;&#1583;&#1575;&#1583;';
	WHEN 6 THEN	 RETURN '&#1588;&#1607;&#1585;&#1610;&#1608;&#1585;';
	WHEN 7 THEN	RETURN '&#1605;&#1607;&#1585;';
	WHEN 8 THEN	RETURN '&#1570;&#1576;&#1575;&#1606;';
	WHEN 9 THEN	RETURN '&#1570;&#1584;&#1585;';
	WHEN 10 THEN RETURN	'&#1583;&#1610;';
	WHEN 12 THEN RETURN	'&#1576;&#1607;&#1605;&#1606;';
	WHEN 12 THEN RETURN	'&#1575;&#1587;&#1601;&#1606;&#1583;';
end CASE;


END;;
DELIMITER ;

-- ----------------------------
-- Function structure for `pyear`
-- ----------------------------
DROP FUNCTION IF EXISTS `pyear`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pyear`(`gdate` datetime) RETURNS char(100) CHARSET utf8
BEGIN
# Copyright (C) 2009  Mohammad Saleh Souzanchi
# WebLog : www.saleh.soozanchi.ir
# Version V1.0

	DECLARE 
		i,
		gy, gm, gd,
		g_day_no,j_day_no, j_np,
		jy,jm,jd INT DEFAULT 0;
	DECLARE resout char(100);
	DECLARE ttime CHAR(20);

	SET gy = YEAR(gdate)-1600;
	SET gm = MONTH(gdate)-1;
	SET gd = DAY(gdate)-1;
	SET ttime = TIME(gdate);
	SET g_day_no = ((365 *  gy) + __mydiv( gy+3, 4 ) - __mydiv( gy+99 , 100 )+ __mydiv ( gy+399, 400 ) );
        SET i = 0;

	WHILE (i < gm) do
		SET  g_day_no = g_day_no + _gdmarray(i);
		SET i = i+1; 
	end WHILE;

	if  gm > 1 and (( gy% 4 = 0 and gy%100 <> 0 )) or gy % 400 = 0 THEN 
		SET 	g_day_no =	g_day_no +1;
	end IF;
	
	SET g_day_no = g_day_no + gd; 

	SET j_day_no = g_day_no -79;
	SET j_np =  j_day_no DIV 12053;
	set j_day_no = j_day_no % 12053;
	SET jy = 979 + 33 * j_np + 4 * __mydiv(j_day_no,1461);
	SET j_day_no = j_day_no % 1461;

	if j_day_no >= 366 then 
		SET jy = jy + __mydiv(j_day_no-1, 365);
		SET j_day_no =( j_day_no-1) % 365;
	end if;

	SET i = 0;

	WHILE ( i < 11 and j_day_no >= _jdmarray(i) ) do
		SET  j_day_no = j_day_no -  _jdmarray(i);
		SET i = i+1;
	end WHILE;

	SET jm = i+1;
	SET jd = j_day_no+1;
	RETURN  	jy;
END;;
DELIMITER ;

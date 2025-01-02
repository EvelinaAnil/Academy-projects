DECLARE
	@x INT ,
	@t INT,
	@d INT  ;
SET @d=(9*9)-(4*(2)*(10))
if @d<0
print 'Нет корней';
else
BEGIN
if @d=0
SET @x=-(9/(2*2));
else 
SET @x=((-(9)-(SQUARE(@d)))/2*2);
SET @t =((-(9)+(SQUARE(@d)))/2*2);
print CONCAT('x_1= ',@x,' x_2= ',@t);
END

DECLARE
	@x INT ,
	@t INT,
	@a int=2,
	@b int=9,
	@c int=10,
	@d INT  ;
SET @d=(@b*@b)-(4*(@a)*(@c))
if @d<0
print 'Нет корней';
else
BEGIN
if @d=0
SET @x=-(@b/(2*@a));
else 
SET @x=((-(@b)-(SQUARE(@d)))/2*@a);
SET @t =((-(@b)+(SQUARE(@d)))/2*@a);
print CONCAT('x_1= ',@x,' x_2= ',@t);
END






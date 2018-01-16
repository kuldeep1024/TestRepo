DELIMITER $$

create DEFINER=`root`@`localhost` PROCEDURE `test1`(IN id varchar(50))
BEGIN

select * from active_users where agentid=id;

END


call test1('admin')


DELIMITER $$

create DEFINER=`root`@`localhost` PROCEDURE `test2`(IN id varchar(50),out countt int)
BEGIN

select count(*) into countt from active_users;/*where agentid=id;*/

END


call test2('admin',@countt);
select @countt;
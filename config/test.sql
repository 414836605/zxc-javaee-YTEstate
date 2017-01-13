select * from emp
select * from owner
select * from garage
select * from fee
select * from owner
select * from buy
select * from maintain
select * from entry
select * from empleave
select * from salary



update fee set fee_type = 0



select fee_id, fee.owner_id, fee_time, fee_type, owner_name 
from fee 
inner join owner
where fee.owner_id = owner.owner_id
limit 0,10

select fee_id, fee.owner_id owner_id, fee_time ft, fee_type,
		owner.owner_name
		from fee
		inner join owner
		where
			fee.owner_id = owner.owner_id
			and fee.fee_time between '2015-03-13 00:00:00.0' and '2016-03-13 00:00:00.0'
			and owner.owner_name like '%张%'
select 
fee_id, fee.owner_id, fee_time, fee_type, owner_name,   fee_build, fee_garage, fee_park, fee_sum   
from fee   inner join owner    WHERE fee.owner_id = owner.owner_id    
and fee_type = 0        

limit 1,100


insert into owner (owner_name, owner_perid, owner_sex, owner_phone, 
owner_email, owner_info, owner_build, owner_home, owner_garage, owner_park) 
(select owner_name, owner_perid, owner_sex, owner_phone, 
owner_email, owner_info, owner_build, owner_home, owner_garage, owner_park from owner)


insert into fee (owner_id,fee_time,fee_build,fee_garage,fee_park,fee_type,fee_sum) 
(select owner_id,fee_time,fee_build,fee_garage,fee_park,fee_type,fee_sum from fee)



insert into `owner` values ('1', '刘德华', '210722197006067334', '男', '17728290875', '678657656@qq.com', '妻子与女儿', '1', '001', '1', '1');
insert into `owner` values ('2', '张涛', '210732319770809234', '男', '13842342384', '123232343@qq.com', '单身', '2', '002', '2', '2');
insert into `owner` values ('3', '周润发', '210710197607268765', '男', '12288890987', '124454556@qq.com', '单身', '3', '003', '3', '3');
insert into `owner` values ('4', '薛之谦', '21078919805278976', '男', '22227756626', '232223222@163.com', '单身', '1', 'a16', '4', '4');
insert into `owner` values ('5', '古丽扎纳', '210789198808239876', '女', '22222112121', '333223323@163.com', '丈夫', '2', 'b23', '5', '5');
insert into `owner` values ('6', '刘晓庆', '210288196002209876', '女', '22222222222', '434332232@163.com', '丈夫与儿子', '3', 'a12', '6', '6');



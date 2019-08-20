prompt PL/SQL Developer import file
prompt Created on 2019年8月20日 by 秦义绝
set feedback off
set define off
prompt Disabling triggers for MEMBER...
alter table MEMBER disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for TRAVELLER...
alter table TRAVELLER disable all triggers;
prompt Disabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable all triggers;
prompt Disabling triggers for PERMISSION...
alter table PERMISSION disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable all triggers;
prompt Disabling triggers for SYSLOG...
alter table SYSLOG disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for USERS_ROLE...
alter table USERS_ROLE disable all triggers;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C005448;
alter table ORDERS disable constraint SYS_C005449;
prompt Disabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable constraint SYS_C005452;
alter table ORDER_TRAVELLER disable constraint SYS_C005453;
prompt Disabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable constraint SYS_C005463;
alter table ROLE_PERMISSION disable constraint SYS_C005464;
prompt Disabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE disable constraint SYS_C005459;
alter table USERS_ROLE disable constraint SYS_C005460;
prompt Deleting USERS_ROLE...
delete from USERS_ROLE;
commit;
prompt Deleting USERS...
delete from USERS;
commit;
prompt Deleting SYSLOG...
delete from SYSLOG;
commit;
prompt Deleting ROLE_PERMISSION...
delete from ROLE_PERMISSION;
commit;
prompt Deleting ROLE...
delete from ROLE;
commit;
prompt Deleting PERMISSION...
delete from PERMISSION;
commit;
prompt Deleting ORDER_TRAVELLER...
delete from ORDER_TRAVELLER;
commit;
prompt Deleting TRAVELLER...
delete from TRAVELLER;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting PRODUCT...
delete from PRODUCT;
commit;
prompt Deleting MEMBER...
delete from MEMBER;
commit;
prompt Loading MEMBER...
insert into MEMBER (id, name, nickname, phonenum, email)
values ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');
commit;
prompt 1 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('DF8EE90573E7416499D6F6C58705805B', 'GuangDong_001', '广东双飞五日游', '西安', to_timestamp('14-08-2019 14:30:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 13140, '豪华游艇，广州全境游，全程希尔顿，小蛮腰蹦极，本店特有。你值得拥有', 1);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', to_timestamp('25-04-2018 14:30:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1800, '魔都我来了', 0);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
commit;
prompt 4 records loaded
prompt Loading ORDERS...
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('5DC6A48DD4E94592AE904930EA866AF1', '54351', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('2FF351C4AC744E2092DCF08CFD314421', '61890', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('A0657832D93E4B10AE88A2D4B70B1A21', '91765', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('E4DD4C45EED84870ABA83574A8010831', '11211', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('96CC8BD43C734CC2ACBFF09501B4DD51', '22122', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('55F9AF582D5A4DB28FB4EC3199385761', '31333', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('CA005CF1BE3C4EF68F88ABC7DF30E971', '14444', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('3081770BC3984EF092D9E99760FDABD1', '15555', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('0E7231DC797C486290E8713CA3C6ECCC', '12345', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('5DC6A48DD4E94592AE904930EA866AFA', '54321', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('2FF351C4AC744E2092DCF08CFD314420', '67890', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('E4DD4C45EED84870ABA83574A801083E', '11111', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('55F9AF582D5A4DB28FB4EC3199385762', '33333', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (id, ordernum, ordertime, peoplecount, orderdesc, paytype, orderstatus, productid, memberid)
values ('3081770BC3984EF092D9E99760FDABDE', '55555', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
commit;
prompt 17 records loaded
prompt Loading TRAVELLER...
insert into TRAVELLER (id, name, sex, phonenum, credentialstype, credentialsnum, travellertype)
values ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
insert into TRAVELLER (id, name, sex, phonenum, credentialstype, credentialsnum, travellertype)
values ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);
commit;
prompt 2 records loaded
prompt Loading ORDER_TRAVELLER...
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (orderid, travellerid)
values ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');
commit;
prompt 9 records loaded
prompt Loading PERMISSION...
insert into PERMISSION (id, permissionname, url)
values ('AF1FD8D9D18A4977919F6836B14B791D', 'user findAll', '/user/findAll.do');
insert into PERMISSION (id, permissionname, url)
values ('84DF9099DD76401DB4F2C4E939809F33', 'user findById', '/user/findById.do');
insert into PERMISSION (id, permissionname, url)
values ('64F351CC7D404E15A05C7B912D0BE3D0', 'save', '/user/save.do');
commit;
prompt 3 records loaded
prompt Loading ROLE...
insert into ROLE (id, rolename, roledesc)
values ('988269A035B0442C93B139970B7DA70A', 'SWAG', 'vvip');
insert into ROLE (id, rolename, roledesc)
values ('1111', 'ADMIN', 'vip');
insert into ROLE (id, rolename, roledesc)
values ('2222', 'USER', 'vip');
commit;
prompt 3 records loaded
prompt Loading ROLE_PERMISSION...
insert into ROLE_PERMISSION (permissionid, roleid)
values ('84DF9099DD76401DB4F2C4E939809F33', '1111');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('84DF9099DD76401DB4F2C4E939809F33', '988269A035B0442C93B139970B7DA70A');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('AF1FD8D9D18A4977919F6836B14B791D', '1111');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('AF1FD8D9D18A4977919F6836B14B791D', '2222');
insert into ROLE_PERMISSION (permissionid, roleid)
values ('AF1FD8D9D18A4977919F6836B14B791D', '988269A035B0442C93B139970B7DA70A');
commit;
prompt 5 records loaded
prompt Loading SYSLOG...
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('313B83A450F6427FBFE61FFC3D3FB954', to_timestamp('19-08-2019 15:52:22.650000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 29, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('2CEE1BF39E28416AA3B1CC0D49E2ABA1', to_timestamp('19-08-2019 16:13:03.202000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 27, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0232886F60BF40AC946F0F0A19555080', to_timestamp('19-08-2019 16:28:48.916000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/product/findAll.do', 24, 'cn.kxc.ssm.controller.ProductController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('B63F5E5E241D4642B2F92EF434C61618', to_timestamp('19-08-2019 16:28:50.529000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/orders/findAll.do', 53, 'cn.kxc.ssm.controller.OrdersController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('EDEB9D6FB2D344C7B9984CD1FFE6F525', to_timestamp('19-08-2019 16:28:52.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/user/findAll.do', 11, 'cn.kxc.ssm.controller.UserController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('EDCBE687F7E0408FB0DF5FEE8A6F82C1', to_timestamp('19-08-2019 16:28:53.806000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/role/findAll.do', 2, 'cn.kxc.ssm.controller.RoleController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('20B94BB43CB24362917D03A8379FB0AC', to_timestamp('19-08-2019 16:28:55.183000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/orders/findAll.do', 8, 'cn.kxc.ssm.controller.OrdersController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8B8676CA451F4B6ABE8AAD8A58A39B3D', to_timestamp('19-08-2019 16:28:56.360000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/user/findAll.do', 2, 'cn.kxc.ssm.controller.UserController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8D860EF4D8A94048B8021613FFF7C85C', to_timestamp('19-08-2019 16:28:57.531000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/role/findAll.do', 3, 'cn.kxc.ssm.controller.RoleController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('DEEA4E621E1B46438B614C75094D7F4B', to_timestamp('19-08-2019 16:28:58.808000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/permission/findAll.do', 8, 'cn.kxc.ssm.controller.PermissionController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('BC4E4540D514435999EC1A71BF97873A', to_timestamp('19-08-2019 16:29:00.689000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/orders/findAll.do', 8, 'cn.kxc.ssm.controller.OrdersController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('93565D4347F5400A869C4B73C68682DE', to_timestamp('19-08-2019 16:29:01.783000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/role/findAll.do', 4, 'cn.kxc.ssm.controller.RoleController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('5EAEE22DAE95419980259AEF82359F47', to_timestamp('19-08-2019 16:29:02.975000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/user/findAll.do', 2, 'cn.kxc.ssm.controller.UserController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('7470C81E06B140C9952CEAFBC551E5F1', to_timestamp('19-08-2019 16:29:04.069000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/orders/findAll.do', 7, 'cn.kxc.ssm.controller.OrdersController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3370D2D20A034059869DB82772F1AD5C', to_timestamp('19-08-2019 16:29:05.339000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/product/findAll.do', 4, 'cn.kxc.ssm.controller.ProductController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0ED4E6E4805B46B7828B7AC50DFBFEFE', to_timestamp('19-08-2019 16:29:06.337000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/role/findAll.do', 3, 'cn.kxc.ssm.controller.RoleController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D8F01ADA917E4883896169FCD5D5C498', to_timestamp('19-08-2019 16:29:07.590000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/orders/findAll.do', 6, 'cn.kxc.ssm.controller.OrdersController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('2C14600D4C5041B7B18CA3DE870353C3', to_timestamp('19-08-2019 16:29:09.581000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 15, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F9055AFD993D4510A27B4D2443C3034D', to_timestamp('19-08-2019 16:30:04.396000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 5, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9BEF8B21FBD94C73A3221B1DB0673417', to_timestamp('19-08-2019 16:30:15.172000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/orders/findAll.do', 14, 'cn.kxc.ssm.controller.OrdersController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('FFCB74ADA5F149E2AE8C3CF78B5CE523', to_timestamp('19-08-2019 16:30:19.473000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/orders/findAll.do', 7, 'cn.kxc.ssm.controller.OrdersController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8D834D256A1C45689AFD3EA974853456', to_timestamp('19-08-2019 16:30:28.107000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 3, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('6BDC5A079CC6474F9A0A533A3A2130F3', to_timestamp('19-08-2019 16:31:00.740000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 5, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('31C600BD322C47CBBED6BFB731F136E0', to_timestamp('19-08-2019 16:31:13.859000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 6, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F3AF3328C6A44A2EB6C486A68AB76526', to_timestamp('19-08-2019 16:31:15.875000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 7, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('0CFA4F0EB35F401393C7C360FC38FA98', to_timestamp('19-08-2019 16:31:22.478000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 40, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('91243297CCA34C189604797EA41C3C0C', to_timestamp('19-08-2019 16:31:26.247000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 5, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('642C813E81E544AE8E68FBA23FBDE4C2', to_timestamp('19-08-2019 16:31:33.368000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 278, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('840C9C19633B4B46B197BD11CE06E331', to_timestamp('19-08-2019 16:31:36.482000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 3, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('9A1AAB7132484689BA48040D708E03CB', to_timestamp('19-08-2019 16:31:38.470000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 4, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('D9438B037CB646A588032A0EC59CBF20', to_timestamp('19-08-2019 16:31:40.110000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 4, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('13A447664EBA43969A3B1504070A09D4', to_timestamp('19-08-2019 16:31:48.515000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 7, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8E3DFD2137684A51861FB7BEFCF59019', to_timestamp('19-08-2019 16:31:50.165000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 7, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('CAA124DE4A8E46D18292BEE0A1344D37', to_timestamp('19-08-2019 16:31:51.608000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 2, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('641D77F5E6B64D1B9068623E8D0DEF5F', to_timestamp('19-08-2019 16:31:54.874000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 3, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('73C354B8D65E409281978BB5EB32AE34', to_timestamp('19-08-2019 16:31:55.807000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 2, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('6BBF2F3F1BDE4F86B7D8596972CCAEE1', to_timestamp('19-08-2019 16:31:56.555000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 2, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('C29B4CC6F6D04FB89DE2E17C5E65EF2D', to_timestamp('19-08-2019 16:31:57.227000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 4, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('5685374E89F74146AE7ADF613C1BABE5', to_timestamp('19-08-2019 15:44:08.532000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/user/findAll.do', 26, 'cn.kxc.ssm.controller.UserController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('50750AE414344124ACADD04FC540C6F9', to_timestamp('19-08-2019 15:44:10.499000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/role/findAll.do', 9, 'cn.kxc.ssm.controller.RoleController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('A4A54A82E53A4DF890691BF301372BB2', to_timestamp('19-08-2019 15:44:21.207000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/role/findAll.do', 3, 'cn.kxc.ssm.controller.RoleController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('F4408FFCCE2D4FBDA2B5A9EC6986275D', to_timestamp('19-08-2019 16:05:44.998000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 24, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('3ED95370C1384D2B840271CF6B7DD101', to_timestamp('19-08-2019 16:01:47.440000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 25, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('BF374A67180C413AA64CE65D2ED8126D', to_timestamp('19-08-2019 16:28:46.547000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/role/findAll.do', 29, 'cn.kxc.ssm.controller.RoleController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('10F827947AD14DFAA64A5AC756A26E26', to_timestamp('19-08-2019 16:31:57.869000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 2, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
insert into SYSLOG (id, visittime, username, ip, url, executiontime, method)
values ('8749873E4231465B9CA040B69D7A0E01', to_timestamp('19-08-2019 16:31:58.553000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'kxc', '0:0:0:0:0:0:0:1', '/ssm_web/sysLog/findAll.do', 2, 'cn.kxc.ssm.controller.AOPSysLogController.findAll');
commit;
prompt 46 records loaded
prompt Loading USERS...
insert into USERS (id, email, username, password, phonenum, status)
values ('F843D9F0E999438A9968CAE624A18563', 'kxc@kxc.cn', 'kxc', '$2a$10$t1IEdrNKyvk9S1KHjaB2lOOCl6D7WjIPIuhmufHYg5Q7cZ1BoiyKq', '18888888888', 1);
insert into USERS (id, email, username, password, phonenum, status)
values ('F0962A54FB6B48E0806F59DB10CEB9EF', 'kxc@kkk.cn', 'py', '$2a$10$oEKZ8P3Kx1pnTwn.qgGiIuF/DfUVsttsexR6x7wyFmctOK1vaIx3C', '18888888889', 1);
insert into USERS (id, email, username, password, phonenum, status)
values ('111-222', 'tom@kxc.cn', 'tom', '$2a$10$tJHudmJh6MRPdiL7mv0yfe0nZJbDHuhl7sSTnqNC4DauMik9ppi4K', '13333333333', 1);
commit;
prompt 3 records loaded
prompt Loading USERS_ROLE...
insert into USERS_ROLE (userid, roleid)
values ('111-222', '1111');
insert into USERS_ROLE (userid, roleid)
values ('111-222', '2222');
insert into USERS_ROLE (userid, roleid)
values ('F0962A54FB6B48E0806F59DB10CEB9EF', '2222');
insert into USERS_ROLE (userid, roleid)
values ('F843D9F0E999438A9968CAE624A18563', '1111');
insert into USERS_ROLE (userid, roleid)
values ('F843D9F0E999438A9968CAE624A18563', '2222');
insert into USERS_ROLE (userid, roleid)
values ('F843D9F0E999438A9968CAE624A18563', '988269A035B0442C93B139970B7DA70A');
commit;
prompt 6 records loaded
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C005448;
alter table ORDERS enable constraint SYS_C005449;
prompt Enabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable constraint SYS_C005452;
alter table ORDER_TRAVELLER enable constraint SYS_C005453;
prompt Enabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable constraint SYS_C005463;
alter table ROLE_PERMISSION enable constraint SYS_C005464;
prompt Enabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE enable constraint SYS_C005459;
alter table USERS_ROLE enable constraint SYS_C005460;
prompt Enabling triggers for MEMBER...
alter table MEMBER enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for TRAVELLER...
alter table TRAVELLER enable all triggers;
prompt Enabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable all triggers;
prompt Enabling triggers for PERMISSION...
alter table PERMISSION enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable all triggers;
prompt Enabling triggers for SYSLOG...
alter table SYSLOG enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for USERS_ROLE...
alter table USERS_ROLE enable all triggers;
set feedback on
set define on
prompt Done.

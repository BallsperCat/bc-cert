-- 删除
delete from bc_cert_cfg_detail;
delete from bc_cert_cfg;
delete from bc_cert_type;

-- 证件类别
insert into bc_cert_type (id, code, name, order_no, file_date, author_id, modified_date, modifier_id)
  select generate_series(1, 2), UNNEST(array ['CarManCert', 'CarCert']), UNNEST(array ['司机证件', '车辆证件']),
    generate_series(1, 2), now(), (select id
                                   from bc_identity_actor_history
                                   where actor_code = 'admin' and current = true), now(), (select id
                                                                                           from
                                                                                             bc_identity_actor_history
                                                                                           where
                                                                                             actor_code = 'admin' and
                                                                                             current = true)
  from bc_dual
  where not exists(select 0
                   from bc_cert_type
                   where id in (select *
                                from generate_series(1, 2)));

-- 司机证件/身份证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 1, 'cert-cfg.1', '1001', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certIdentity', '身份证', 2, 172, '1,1:0 0 0 5',
    'DEFAULT_CERT_FORM', now(), (select id
                                 from bc_identity_actor_history
                                 where actor_code = 'admin' and current = true), now(), (select id
                                                                                         from bc_identity_actor_history
                                                                                         where actor_code = 'admin' and
                                                                                               current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 1);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 11, 1, 1, '正面', 86
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 11);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 12, 1, 2, '背面', 86
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 12);

-- 司机证件/驾驶证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 2, 'cert-cfg.2', '1002', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certJSZ', '驾驶证', 2, 182, '1,1:0 0 0 5',
    'DEFAULT_CERT_FORM', now(), (select id
                                 from bc_identity_actor_history
                                 where actor_code = 'admin' and current = true), now(), (select id
                                                                                         from bc_identity_actor_history
                                                                                         where actor_code = 'admin' and
                                                                                               current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 2);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 21, 2, 1, '正面', 91
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 21);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 22, 2, 2, '背面', 91
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 22);

-- 司机证件/从业资格证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 3, 'cert-cfg.3', '1003', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certCYZG', '从业资格证', 1, 160, null, 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 3);

-- 司机证件/户口簿
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 4, 'cert-cfg.4', '1004', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certHKB', '户口簿', 3, 140, 'v:5', 'DEFAULT_CERT_FORM', now(),
    (select id
     from bc_identity_actor_history
     where actor_code = 'admin' and current = true), now(), (select id
                                                             from bc_identity_actor_history
                                                             where actor_code = 'admin' and current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 4);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 41, 4, 1, '户主页', 140
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 41);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 42, 4, 2, '本人页', 140
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 42);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 43, 4, 3, '其它页', 140
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 43);

-- 司机证件/服务资格证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 5, 'cert-cfg.5', '1005', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certFWZG', '服务资格证', 1, 125, null, 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 5);

-- 司机证件/居住证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 6, 'cert-cfg.6', '1006', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certJZZ', '居住证', 2, 172, '1,1:0 0 0 5',
    'DEFAULT_CERT_FORM', now(), (select id
                                 from bc_identity_actor_history
                                 where actor_code = 'admin' and current = true), now(), (select id
                                                                                         from bc_identity_actor_history
                                                                                         where actor_code = 'admin' and
                                                                                               current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 6);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 61, 6, 1, '正面', 86
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 61);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 62, 6, 2, '背面', 86
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 62);

-- 司机证件/LPG证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 7, 'cert-cfg.7', '1007', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certLPG', 'LPG证', 1, 187, null, 'DEFAULT_CERT_FORM', now(),
    (select id
     from bc_identity_actor_history
     where actor_code = 'admin' and current = true), now(), (select id
                                                             from bc_identity_actor_history
                                                             where actor_code = 'admin' and current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 7);

-- 司机证件/计生证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 8, 'cert-cfg.8', '1008', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certJISZ', '计生证', 3, 144, 'v:5', 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 8);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 81, 8, 1, '证号页', 144
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 81);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 82, 8, 2, '婚姻状况页', 144
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 82);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 83, 8, 3, '其它页', 144
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 83);

-- 司机证件/司机签名
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 9, 'cert-cfg.9', '1009', 0, (select id
                                      from bc_cert_type
                                      where name = '司机证件'), 'certQM', '司机签名', 1, 187, null, 'DEFAULT_CERT_FORM', now(),
    (select id
     from bc_identity_actor_history
     where actor_code = 'admin' and current = true), now(), (select id
                                                             from bc_identity_actor_history
                                                             where actor_code = 'admin' and current = true), 1, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 9);

-- 车辆证件/机动车行驶证: 长8.8CM, 宽6CM
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 21, 'cert-cfg.21', '2001', 0, (select id
                                        from bc_cert_type
                                        where name = '车辆证件'), 'CAR_XSZ', '机动车行驶证', 4, 190, 'v:30', 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 0, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 21);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 211, 21, 1, '有效期页', 190
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 211);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 212, 21, 2, '车辆照片页', 190
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 212);

-- 车辆证件/车辆登记证: 长29.5CM, 宽20.9CM
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 22, 'cert-cfg.22', '2002', 0, (select id
                                        from bc_cert_type
                                        where name = '车辆证件'), 'CAR_DJZ', '车辆登记证', 2, 209, 'v:5', 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 0, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 22);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 221, 22, 1, '正面', 209
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 221);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 222, 22, 2, '背面', 209
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 222);

-- 车辆证件/车辆购置税完税证明: 长16CM，宽12.4CM
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 23, 'cert-cfg.23', '2003', 0, (select id
                                        from bc_cert_type
                                        where name = '车辆证件'), 'CAR_GZSWSZM', '车辆购置税完税证明', 1, 160, null,
    'DEFAULT_CERT_FORM', now(), (select id
                                 from bc_identity_actor_history
                                 where actor_code = 'admin' and current = true), now(), (select id
                                                                                         from bc_identity_actor_history
                                                                                         where actor_code = 'admin' and
                                                                                               current = true), 0, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 23);

-- 车辆证件/购置税发票: 长24CM，宽15.2CM
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 24, 'cert-cfg.24', '2004', 0, (select id
                                        from bc_cert_type
                                        where name = '车辆证件'), 'CAR_GZSFP', '购置税发票', 1, 240, null, 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 0, 1
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 24);

-- 车辆证件/购车发票: 长24CM. 宽17.7CM
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 25, 'cert-cfg.25', '2005', 0, (select id
                                        from bc_cert_type
                                        where name = '车辆证件'), 'CAR_GCFP', '购车发票', 1, 240, null, 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 0, 1
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 25);

-- 车辆证件/强检使用证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 26, 'cert-cfg.26', '2006', 0, (select id
                                        from bc_cert_type
                                        where name = '车辆证件'), 'CAR_QJSYZ', '强检使用证', 2, 253, 'h:5', 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 0, 1
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 26);

insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 261, 26, 1, '正面', 124
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 261);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 262, 26, 2, '背面', 124
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 262);

-- 车辆证件/道路运输证
insert into bc_cert_cfg (id, uid_, order_no, status_, type_id, code, name, page_count, width, combine
  , tpl, file_date, author_id, modified_date, modifier_id, one_page_one_typography, print_direction)
  select 27, 'cert-cfg.27', '2007', 0, (select id
                                        from bc_cert_type
                                        where name = '车辆证件'), 'CAR_DLYSZ', '道路运输证', 2, 205, 'v:30', 'DEFAULT_CERT_FORM',
    now(), (select id
            from bc_identity_actor_history
            where actor_code = 'admin' and current = true), now(), (select id
                                                                    from bc_identity_actor_history
                                                                    where actor_code = 'admin' and current = true), 0, 0
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg
                   where id = 27);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 271, 27, 1, '正面', 205
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 271);
insert into bc_cert_cfg_detail (id, pid, page_no, name, width)
  select 272, 27, 2, '背面', 205
  from bc_dual
  where not exists(select 0
                   from bc_cert_cfg_detail
                   where id = 272);

-- 证件图片打印页面模板
-- DELETE FROM BC_TEMPLATE WHERE CODE IN ('DEFAULT_CERT_PRINT');
-- 数据 SQL
insert into BC_TEMPLATE (ID, UID_, STATUS_, ORDER_, CATEGORY, CODE, VERSION_, FORMATTED, INNER_
  , PATH, SIZE_, SUBJECT, DESC_, TYPE_ID, FILE_DATE, AUTHOR_ID)
  select NEXTVAL('HIBERNATE_SEQUENCE'), 'cert.' || NEXTVAL('HIBERNATE_SEQUENCE'), 0, '5003', '平台/证件管理',
    'DEFAULT_CERT_PRINT', '1', true, false, '/bc/default.cert.print.ftl', 1000, '证件图片打印模板', '', (select id
                                                                                                 from BC_TEMPLATE_TYPE
                                                                                                 where
                                                                                                   code = 'freemarker'),
    now(), (select id
            from BC_IDENTITY_ACTOR_HISTORY
            where actor_code = 'admin' and current = true)
  from bc_dual
  where not exists(select 0
                   from bc_template
                   where CODE = 'DEFAULT_CERT_PRINT' and version_ = '1');

/*
-- 证件配置
select t.CODE, t.name, c.CODE, c.name, c.uid_, c.width, c.combine, d.name, d.*, c.* 
	from bc_cert_cfg c
	inner join bc_cert_type t on t.id = c.type_id
	left join bc_cert_cfg_detail d on c.id = d.pid
	order by t.order_no, c.order_no, d.page_no;
*/
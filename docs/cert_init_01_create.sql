drop table if exists BC_CERT_CFG_DETAIL;
drop table if exists BC_CERT_CFG;
drop table if exists BC_CERT_TYPE;


create table BC_CERT_TYPE (
  ID            int          not null,
  CODE          varchar(100) not null unique,
  NAME          varchar(255) not null,
  ORDER_NO      varchar(10),
  AUTHOR_ID     int          not null,
  FILE_DATE     timestamp    not null,
  MODIFIER_ID   int          not null,
  MODIFIED_DATE timestamp    not null,
  constraint BCPK_CERT_TYPE primary key (ID)
);
comment on table BC_CERT_TYPE is '证件类别';
comment on column BC_CERT_TYPE.ID is 'ID';
comment on column BC_CERT_TYPE.CODE is '编码';
comment on column BC_CERT_TYPE.NAME is '名称';
comment on column BC_CERT_TYPE.ORDER_NO is '排序号';
comment on column BC_CERT_TYPE.AUTHOR_ID is '创建人ID';
comment on column BC_CERT_TYPE.FILE_DATE is '创建时间';
comment on column BC_CERT_TYPE.MODIFIER_ID is '最后修改人ID';
comment on column BC_CERT_TYPE.MODIFIED_DATE is '最后修改时间';
alter table BC_CERT_TYPE
  add constraint BCFK_CERT_TYPE_AUTHOR foreign key (AUTHOR_ID)
references BC_IDENTITY_ACTOR_HISTORY (ID)
on update restrict on delete restrict;
alter table BC_CERT_TYPE
  add constraint BCFK_CERT_TYPE_MODIFIER foreign key (MODIFIER_ID)
references BC_IDENTITY_ACTOR_HISTORY (ID)
on update restrict on delete restrict;


create table BC_CERT_CFG (
  ID                      int            not null,
  UID_                    varchar(36)    not null,
  STATUS_                 int            not null,
  TYPE_ID                 int            not null,
  CODE                    varchar(100)   not null unique,
  NAME                    varchar(100)   not null,
  PAGE_COUNT              int            not null,
  WIDTH                   decimal(10, 2) not null,
  COMBINE                 varchar(50),
  ORDER_NO                varchar(10),
  TPL                     varchar(100)   not null,
  AUTHOR_ID               int            not null,
  FILE_DATE               timestamp      not null,
  MODIFIER_ID             int            not null,
  MODIFIED_DATE           timestamp      not null,
  ONE_PAGE_ONE_TYPOGRAPHY int            not null,
  PRINT_DIRECTION         int            not null,
  constraint BCPK_CERT_CFG primary key (ID)
);
comment on table BC_CERT_CFG is '证件配置';
comment on column BC_CERT_CFG.ID is 'ID';
comment on column BC_CERT_CFG.UID_ is 'UID_';
comment on column BC_CERT_CFG.STATUS_ is '状态 : 0-正常,1-禁用';
comment on column BC_CERT_CFG.TYPE_ID is '所属类别ID';
comment on column BC_CERT_CFG.CODE is '编码';
comment on column BC_CERT_CFG.NAME is '名称';
comment on column BC_CERT_CFG.PAGE_COUNT is '面数';
comment on column BC_CERT_CFG.WIDTH is '打印宽度 : 毫米单位';
comment on column BC_CERT_CFG.COMBINE is '合并配置';
comment on column BC_CERT_CFG.ORDER_NO is '排序号';
comment on column BC_CERT_CFG.TPL is '所用模板';
comment on column BC_CERT_CFG.AUTHOR_ID is '创建人';
comment on column BC_CERT_CFG.FILE_DATE is '创建时间';
comment on column BC_CERT_CFG.MODIFIER_ID is '最后修改人';
comment on column BC_CERT_CFG.MODIFIED_DATE is '最后修改时间';
comment on column BC_CERT_CFG.ONE_PAGE_ONE_TYPOGRAPHY is '一页一版';
comment on column BC_CERT_CFG.PRINT_DIRECTION is '打印方向，默认是0，纵向打印';
alter table BC_CERT_CFG
  add constraint BCFK_CERT_CFG_TYPE foreign key (TYPE_ID)
references BC_CERT_TYPE (ID)
on update restrict on delete restrict;
alter table BC_CERT_CFG
  add constraint BCFK_CERT_CFG_AUTHOR foreign key (AUTHOR_ID)
references BC_IDENTITY_ACTOR_HISTORY (ID)
on update restrict on delete restrict;
alter table BC_CERT_CFG
  add constraint BCFK_CERT_CFG_MODIFIER foreign key (MODIFIER_ID)
references BC_IDENTITY_ACTOR_HISTORY (ID)
on update restrict on delete restrict;


create table BC_CERT_CFG_DETAIL (
  ID      int            not null,
  PID     int            not null,
  PAGE_NO int            not null,
  WIDTH   decimal(10, 2) not null,
  NAME    varchar(100)   not null,
  constraint BCPK_CERT_CFG_DETAIL primary key (ID)
);
comment on table BC_CERT_CFG_DETAIL is '证件配置明细';
comment on column BC_CERT_CFG_DETAIL.ID is 'ID';
comment on column BC_CERT_CFG_DETAIL.PID is '所属配置ID';
comment on column BC_CERT_CFG_DETAIL.PAGE_NO is '页码';
comment on column BC_CERT_CFG_DETAIL.WIDTH is '打印宽度 : 毫米单位';
comment on column BC_CERT_CFG_DETAIL.NAME is '名称';

alter table BC_CERT_CFG_DETAIL
  add constraint BCFK_CERT_CFG_DETAIL foreign key (PID)
references BC_CERT_CFG (ID)
on update restrict on delete cascade;

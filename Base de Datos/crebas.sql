/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     24/11/2020 11:08:48                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SERVICIOS') and o.name = 'FK_SERVICIO_TIENE_USUARIOS')
alter table SERVICIOS
   drop constraint FK_SERVICIO_TIENE_USUARIOS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TIPO') and o.name = 'FK_TIPO_RELATIONS_USUARIOS')
alter table TIPO
   drop constraint FK_TIPO_RELATIONS_USUARIOS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SERVICIOS')
            and   name  = 'TIENE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SERVICIOS.TIENE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIOS')
            and   type = 'U')
   drop table SERVICIOS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TIPO')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TIPO.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPO')
            and   type = 'U')
   drop table TIPO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('USUARIOS')
            and   type = 'U')
   drop table USUARIOS
go

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS (
   IDSERVICIO           int                  not null,
   CEDULAID             char(13)             null,
   NOMBRESERVICIO       varchar(30)          null,
   FECHASERVICIO        datetime             null,
   COSTOSERVICIO        float                null,
   constraint PK_SERVICIOS primary key nonclustered (IDSERVICIO)
)
go

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on SERVICIOS (
CEDULAID ASC
)
go

/*==============================================================*/
/* Table: TIPO                                                  */
/*==============================================================*/
create table TIPO (
   IDCLIENTE            int                  not null,
   CEDULAID             char(13)             null,
   TIPOUSU              varchar(15)          null,
   constraint PK_TIPO primary key nonclustered (IDCLIENTE)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on TIPO (
CEDULAID ASC
)
go

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS (
   CEDULAID             char(13)             not null,
   NOMBRE               varchar(30)          null,
   APELLIDO             varchar(30)          null,
   ESTADO               varchar(15)          null,
   constraint PK_USUARIOS primary key nonclustered (CEDULAID)
)
go

alter table SERVICIOS
   add constraint FK_SERVICIO_TIENE_USUARIOS foreign key (CEDULAID)
      references USUARIOS (CEDULAID)
go

alter table TIPO
   add constraint FK_TIPO_RELATIONS_USUARIOS foreign key (CEDULAID)
      references USUARIOS (CEDULAID)
go


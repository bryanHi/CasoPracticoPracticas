/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     1/12/2020 17:49:30                           */
/*==============================================================*/


drop table if exists ESTADOUSUARIO;

drop table if exists PERFILUSUARIO;

drop table if exists SERVICIOS;

drop table if exists TIPO;

drop table if exists USUARIOS;

/*==============================================================*/
/* Table: ESTADOUSUARIO                                         */
/*==============================================================*/
create table ESTADOUSUARIO
(
   IDESTADO             int not null,
   ESTADO               varchar(15) not null,
   primary key (IDESTADO)
);

/*==============================================================*/
/* Table: PERFILUSUARIO                                         */
/*==============================================================*/
create table PERFILUSUARIO
(
   IDPERFILUSUARIO      int not null,
   IDESTADO             int,
   CEDULAID             char(13),
   IDCLIENTE            int,
   primary key (IDPERFILUSUARIO)
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS
(
   IDSERVICIO           int not null,
   CEDULAID             char(13),
   NOMBRESERVICIO       varchar(30),
   FECHASERVICIO        date,
   COSTOSERVICIO        float,
   primary key (IDSERVICIO)
);

/*==============================================================*/
/* Table: TIPO                                                  */
/*==============================================================*/
create table TIPO
(
   IDCLIENTE            int not null,
   TIPOUSU              varchar(15),
   primary key (IDCLIENTE)
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   CEDULAID             char(13) not null,
   NOMBRE               varchar(30) not null,
   APELLIDO             varchar(30) not null,
   CORREO               varchar(18) not null,
   CLAVE                varchar(15) not null,
   primary key (CEDULAID)
);

alter table PERFILUSUARIO add constraint FK_ES foreign key (CEDULAID)
      references USUARIOS (CEDULAID) on delete restrict on update restrict;

alter table PERFILUSUARIO add constraint FK_ES2 foreign key (IDCLIENTE)
      references TIPO (IDCLIENTE) on delete restrict on update restrict;

alter table PERFILUSUARIO add constraint FK_ES3 foreign key (IDESTADO)
      references ESTADOUSUARIO (IDESTADO) on delete restrict on update restrict;

alter table SERVICIOS add constraint FK_TIENE foreign key (CEDULAID)
      references USUARIOS (CEDULAID) on delete restrict on update restrict;


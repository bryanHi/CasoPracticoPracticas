/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     1/12/2020 16:25:12                           */
/*==============================================================*/


drop table if exists PERFILUSU;

drop table if exists SERVICIOS;

drop table if exists USUARIOS;

/*==============================================================*/
/* Table: PERFILUSU                                             */
/*==============================================================*/
create table PERFILUSU
(
   IDPERFIL             int not null,
   CEDULAID             char(13),
   PERFIUSU             varchar(15),
   primary key (IDPERFIL)
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
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   CEDULAID             char(13) not null,
   NOMBRE               varchar(30) not null,
   APELLIDO             varchar(30) not null,
   ESTADO               varchar(15) not null,
   CORREO               varchar(18) not null,
   CONTRASENIA          varchar(15) not null,
   primary key (CEDULAID)
);

alter table PERFILUSU add constraint FK_RELATIONSHIP_2 foreign key (CEDULAID)
      references USUARIOS (CEDULAID) on delete restrict on update restrict;

alter table SERVICIOS add constraint FK_TIENE foreign key (CEDULAID)
      references USUARIOS (CEDULAID) on delete restrict on update restrict;


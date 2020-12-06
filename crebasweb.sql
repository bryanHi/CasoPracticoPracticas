/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     25/11/2020 8:47:36                           */
/*==============================================================*/


drop table if exists SERVICIOS;

drop table if exists TIPO;

drop table if exists USUARIOS;

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
   CEDULAID             char(13),
   TIPOUSU              varchar(15),
   primary key (IDCLIENTE)
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   CEDULAID             char(13) not null,
   NOMBRE               varchar(30),
   APELLIDO             varchar(30),
   ESTADO               varchar(15),
   primary key (CEDULAID)
);

alter table SERVICIOS add constraint FK_TIENE foreign key (CEDULAID)
      references USUARIOS (CEDULAID);

alter table TIPO add constraint FK_RELATIONSHIP_2 foreign key (CEDULAID)
      references USUARIOS (CEDULAID);


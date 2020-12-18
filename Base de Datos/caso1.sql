/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     17/12/2020 20:08:05                          */
/*==============================================================*/



/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO
(
   ID_ESTADO            int NOT NULL AUTO_INCREMENT,
   NOMBRE_ESTADO        varchar(30)                    null,
   constraint PK_ESTADO primary key (ID_ESTADO)
);

/*==============================================================*/
/* Index: ESTADO_PK                                             */
/*==============================================================*/
create unique index ESTADO_PK on ESTADO (
ID_ESTADO ASC
);

/*==============================================================*/
/* Table: FORMULARIO_SERVICIO                                   */
/*==============================================================*/
create table FORMULARIO_SERVICIO
(
   ID_FORMULARIO_SERVICIO int NOT NULL AUTO_INCREMENT,
   ID_SERVICIOS         integer                        null,
   FECHA_FORMULARIO_SERVICIO timestamp                      null,
   constraint PK_FORMULARIO_SERVICIO primary key (ID_FORMULARIO_SERVICIO)
);

/*==============================================================*/
/* Index: FORMULARIO_SERVICIO_PK                                */
/*==============================================================*/
create unique index FORMULARIO_SERVICIO_PK on FORMULARIO_SERVICIO (
ID_FORMULARIO_SERVICIO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on FORMULARIO_SERVICIO (
ID_SERVICIOS ASC
);

/*==============================================================*/
/* Table: PERFIL_DE_USUARIO                                     */
/*==============================================================*/
create table PERFIL_DE_USUARIO
(
   ID_PERFIL_DE_USUARIO int NOT NULL AUTO_INCREMENT,
   NOMBRE_PERFIL_DE_USUARIO varchar(30)                    null,
   constraint PK_PERFIL_DE_USUARIO primary key (ID_PERFIL_DE_USUARIO)
);

/*==============================================================*/
/* Index: PERFIL_DE_USUARIO_PK                                  */
/*==============================================================*/
create unique index PERFIL_DE_USUARIO_PK on PERFIL_DE_USUARIO (
ID_PERFIL_DE_USUARIO ASC
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS
(
   ID_SERVICIOS        int NOT NULL AUTO_INCREMENT,
   NOMBRE_SERVICIOS     varchar(30)                    null,
   constraint PK_SERVICIOS primary key (ID_SERVICIOS)
);

/*==============================================================*/
/* Index: SERVICIOS_PK                                          */
/*==============================================================*/
create unique index SERVICIOS_PK on SERVICIOS (
ID_SERVICIOS ASC
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   ID_USUARIOS          int NOT NULL AUTO_INCREMENT,
   CEDULA_USUARIOS      varchar(10)                    null,
   NOMBRE_USUARIOS      varchar(30)                    null,
   APELLIDOS_USUARIOS   varchar(30)                    null,
   USERNAME_USUARIOS    varchar(30)                    null,
   PASSWORD_USUARIOS    varchar(100)                   null,
   constraint PK_USUARIOS primary key (ID_USUARIOS)
);

/*==============================================================*/
/* Index: USUARIOS_PK                                           */
/*==============================================================*/
create unique index USUARIOS_PK on USUARIOS (
ID_USUARIOS ASC
);

/*==============================================================*/
/* Table: USUARIOS_PERFIL_USUARIOS                              */
/*==============================================================*/
create table USUARIOS_PERFIL_USUARIOS
(
   ID_USUARIOS_PERFIL_USUARIOS int NOT NULL AUTO_INCREMENT,
   ID_USUARIOS          integer                        null,
   ID_PERFIL_DE_USUARIO integer                        null,
   ID_ESTADO            integer                        null,
   constraint PK_USUARIOS_PERFIL_USUARIOS primary key (ID_USUARIOS_PERFIL_USUARIOS)
);

/*==============================================================*/
/* Index: USUARIOS_PERFIL_USUARIOS_PK                           */
/*==============================================================*/
create unique index USUARIOS_PERFIL_USUARIOS_PK on USUARIOS_PERFIL_USUARIOS (
ID_USUARIOS_PERFIL_USUARIOS ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on USUARIOS_PERFIL_USUARIOS (
ID_USUARIOS ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on USUARIOS_PERFIL_USUARIOS (
ID_PERFIL_DE_USUARIO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on USUARIOS_PERFIL_USUARIOS (
ID_ESTADO ASC
);

alter table FORMULARIO_SERVICIO
   add constraint FK_FORMULAR_RELATIONS_SERVICIO foreign key (ID_SERVICIOS)
      references SERVICIOS (ID_SERVICIOS)
      on update restrict
      on delete restrict;

alter table USUARIOS_PERFIL_USUARIOS
   add constraint FK_USUARIOS_RELATIONS_USUARIOS foreign key (ID_USUARIOS)
      references USUARIOS (ID_USUARIOS)
      on update restrict
      on delete restrict;

alter table USUARIOS_PERFIL_USUARIOS
   add constraint FK_USUARIOS_RELATIONS_PERFIL_D foreign key (ID_PERFIL_DE_USUARIO)
      references PERFIL_DE_USUARIO (ID_PERFIL_DE_USUARIO)
      on update restrict
      on delete restrict;

alter table USUARIOS_PERFIL_USUARIOS
   add constraint FK_USUARIOS_RELATIONS_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO)
      on update restrict
      on delete restrict;

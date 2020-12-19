/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     19/12/2020 8:45:38                           */
/*==============================================================*/


/*==============================================================*/
/* Table: BONO                                                  */
/*==============================================================*/
create table BONO
(
   ID_BONO             int NOT NULL AUTO_INCREMENT,
   ID_REQUISITOS        integer                        null,
   ID_ESTADO            integer                        null,
   ID_CLIENTES          integer                        null,
   FECHA_BONO           timestamp                      null,
   constraint PK_BONO primary key (ID_BONO)
);

/*==============================================================*/
/* Index: BONO_PK                                               */
/*==============================================================*/
create unique index BONO_PK on BONO (
ID_BONO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on BONO (
ID_REQUISITOS ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on BONO (
ID_ESTADO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on BONO (
ID_CLIENTES ASC
);

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES
(
   ID_CLIENTES          int NOT NULL AUTO_INCREMENT,
   ID_USUARIOS          integer                        null,
   CEDULA_CLIENTES      varchar(30)                    null,
   EMAIL_CLIENTES       varchar(50)                    null,
   TELEFONO_CLIENTES    varchar(15)                    null,
   constraint PK_CLIENTES primary key (ID_CLIENTES)
);

/*==============================================================*/
/* Index: CLIENTES_PK                                           */
/*==============================================================*/
create unique index CLIENTES_PK on CLIENTES (
ID_CLIENTES ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on CLIENTES (
ID_USUARIOS ASC
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO
(
   ID_ESTADO            int NOT NULL AUTO_INCREMENT,
   NAME_ESTADO          varchar(30)                    null,
   constraint PK_ESTADO primary key (ID_ESTADO)
);

/*==============================================================*/
/* Index: ESTADO_PK                                             */
/*==============================================================*/
create unique index ESTADO_PK on ESTADO (
ID_ESTADO ASC
);

/*==============================================================*/
/* Table: PERFILES                                              */
/*==============================================================*/
create table PERFILES
(
   ID_PERFILES          int NOT NULL AUTO_INCREMENT,
   NAME_ESTADO          varchar(30)                    null,
   constraint PK_PERFILES primary key (ID_PERFILES)
);

/*==============================================================*/
/* Index: PERFILES_PK                                           */
/*==============================================================*/
create unique index PERFILES_PK on PERFILES (
ID_PERFILES ASC
);

/*==============================================================*/
/* Table: REQUISITOS                                            */
/*==============================================================*/
create table REQUISITOS
(
   ID_REQUISITOS        int NOT NULL AUTO_INCREMENT,
   EDAD_REQUISITOS      integer                        null,
   ESTABILIDAD_LABORAL_REQUISITOS smallint                       null,
   VIVIENDA_REQUISITOS  smallint                       null,
   INGRESOS_REQUISITOS  float                          null,
   EGRESOS_REQUISITOS   float                          null,
   RESULTADOS_REQUISITOS float                          null,
   constraint PK_REQUISITOS primary key (ID_REQUISITOS)
);

/*==============================================================*/
/* Index: REQUISITOS_PK                                         */
/*==============================================================*/
create unique index REQUISITOS_PK on REQUISITOS (
ID_REQUISITOS ASC
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   ID_USUARIOS          int NOT NULL AUTO_INCREMENT,
   ID_PERFILES          integer                        null,
   NAME_USUARIOS        varchar(30)                    null,
   LAST_NAME_USUARIOS   varchar(30)                    null,
   USERNAME_USUARIOS    varchar(30)                    null,
   PASSWORD_USUARIOS    varchar(30)                    null,
   constraint PK_USUARIOS primary key (ID_USUARIOS)
);

/*==============================================================*/
/* Index: USUARIOS_PK                                           */
/*==============================================================*/
create unique index USUARIOS_PK on USUARIOS (
ID_USUARIOS ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on USUARIOS (
ID_PERFILES ASC
);

alter table BONO
   add constraint FK_BONO_RELATIONS_REQUISIT foreign key (ID_REQUISITOS)
      references REQUISITOS (ID_REQUISITOS)
      on update restrict
      on delete restrict;

alter table BONO
   add constraint FK_BONO_RELATIONS_ESTADO foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO)
      on update restrict
      on delete restrict;

alter table BONO
   add constraint FK_BONO_RELATIONS_CLIENTES foreign key (ID_CLIENTES)
      references CLIENTES (ID_CLIENTES)
      on update restrict
      on delete restrict;

alter table CLIENTES
   add constraint FK_CLIENTES_RELATIONS_USUARIOS foreign key (ID_USUARIOS)
      references USUARIOS (ID_USUARIOS)
      on update restrict
      on delete restrict;

alter table USUARIOS
   add constraint FK_USUARIOS_RELATIONS_PERFILES foreign key (ID_PERFILES)
      references PERFILES (ID_PERFILES)
      on update restrict
      on delete restrict;

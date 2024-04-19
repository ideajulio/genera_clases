/* ------------------------------------------------------------------------------
sistemassnya.entidades_serviciozonal
*/
CREATE TABLE sistemassnya.entidades_serviciozonal (
    IdServicioZonal                 int(6) unsigned NOT NULL AUTO_INCREMENT,
    ServicioZonal                   varchar(50) NOT NULL,
    CodigoServicioZonal             varchar(50) NOT NULL,
    EstaActivo                      tinyint NOT NULL DEFAULT 1,
    PorDefecto                      tinyint NOT NULL DEFAULT 0,
    CONSTRAINT PK_serviciozonal PRIMARY KEY (IdServicioZonal)
);
					  
/* ------------------------------------------------------------------------------
sistemassnya.entidades_serviciolocal
*/
CREATE TABLE sistemassnya.entidades_serviciolocal (
    IdServicioLocal                int NOT NULL,
    ServicioLocal                  varchar(50) NOT NULL,
    CodigoServicioLocal             varchar(50) NOT NULL,
    EstaActivo                      tinyint NOT NULL DEFAULT 1,
    PorDefecto                      tinyint NOT NULL DEFAULT 0,
    CONSTRAINT PK_entidades_serviciolocal PRIMARY KEY (IdServicioLocal)
);
 
/* ------------------------------------------------------------------------------
cuidanino.Derivacion
*/
CREATE TABLE cuidanino.Derivacion (
    IdDerivacion                     int NOT NULL,
    IdServicioLocal                 int NOT NULL,
    IdServicioZonal                 int NOT NULL,
    IdTipoDeIntervencion            int NOT NULL,
    idTipoDeVulneracion             int NOT NULL,
    Direccion                       varchar(50) NOT NULL,
    Municipio                       varchar(50) NOT NULL,
    Localidad                       varchar(50) NOT NULL,
    Telefono                       varchar(50) NOT NULL,
    TelefonoDeGuardia               varchar(50) NOT NULL,
    Referente                       varchar(50) NOT NULL,
    Mail                           varchar(50) NOT NULL,
    Horario                        varchar(50) NOT NULL,
    Observacion                     varchar(255) NOT NULL,
    EstaActivo                      tinyint NOT NULL DEFAULT 1,
    PorDefecto                      tinyint NOT NULL DEFAULT 0,
    CONSTRAINT PK_derivacion PRIMARY KEY (IdDerivacion)
);
 
/* ------------------------------------------------------------------------------
cuidanino.Llamante
*/
CREATE TABLE cuidanino.Llamante (
    IdLlamante                      int NOT NULL,
    Apellidos                       varchar(50) NOT NULL,
    Nombres                        varchar(50) NOT NULL,
    IdMunicipio                     tinyint NOT NULL,
    IdLocalidad                     smallint NOT NULL,
    IdBarrio                        smallint NOT NULL,
    IdTelefono                      int NOT NULL,
    CONSTRAINT PK_Llamante PRIMARY KEY (IdLlamante)
);
 
/* ------------------------------------------------------------------------------
cuidanino.cii_Joven
*/
CREATE TABLE cuidanino.cii_Joven(
    IdJoven                         int NOT NULL,
    IdLlamado                       int NOT NULL,
    Apellidos                       varchar(50) NOT NULL,
    Nombres                        varchar(50) NOT NULL,
    Genero                          char(1) NOT NULL,
    IdNacionalidad                 tinyint NOT NULL,
    IdNivelEscolar                 tinyint NOT NULL,
    Establecimiento                 varchar(250) NOT NULL,
    Edad                           tinyint NOT NULL,
    Observacion                     varchar(1000) NOT NULL,
    CONSTRAINT PK_Joven PRIMARY KEY (IdJoven)
);
 
/* ------------------------------------------------------------------------------
cuidanino.Llamado
*/
CREATE TABLE cuidanino.Llamado(
    IdLlamado                       int NOT NULL,
    Inicio                          datetime NOT NULL,
    Fin                             datetime NOT NULL,
    IdTelefono                      int NOT NULL,
    Observacion                     varchar(1000) NOT NULL,
    IdDiscriminador                 char(3) NOT NULL,
    LSC_IdTipoDeLlamadoSinCaso     tinyint NOT NULL,
    LAG_Agresion                   varchar(255) NOT NULL,
    LCC_IdDomicilio                 int NOT NULL,
    LCC_IdLlamante                  int NOT NULL,
    LCC_IdTipoDeRelacion             tinyint NOT NULL,
    LCC_IdTipoDeVulneracion          tinyint NOT NULL,
    LCC_OtraVulneracion              varchar(50) NOT NULL,
    LCC_IdTipoDeConviviente          tinyint NOT NULL,
    LCC_OtroConviviente              varchar(50) NOT NULL,
	Usuario						varchar(50)								,
	Fecha						datetime								,
	UsuarioModificacion			varchar(50)								,
	FechaModificacion			datetime								,
	constraint PK_Llamado primary key nonclustered(
		IdLlamado asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.TipoDeIntervencion
*/
create table cuidanino.TipoDeIntervencion(
	IdTipoDeIntervencion				int								,
	IdLlamado							int								,	
	TipoDeIntervencion					varchar(50)						,
	EstaActivo							bit								 default 1,
	PorDefecto							bit								 default 0,
	constraint PK_TipoDeIntervencion primary key nonclustered(
		IdTipoDeIntervencion asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.ServicioZonal
*/
create table cuidanino.ServicioZonal(
	IdServicioZonal						int								,
	ServicioZonal					varchar(50)							,
	EstaActivo							bit								 default 1,
	PorDefecto							bit								 default 0,
	constraint PK_ServicioZonal primary key nonclustered(
		IdServicioZonal asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.ServicioLocal
*/
create table cuidanino.ServicioLocal(
	IdServicioLocal					int								,
	IdServicioZonal					int								,
	ServicioLocal					varchar(50)						,
	EstaActivo							bit								 default 1,
	PorDefecto							bit								 default 0,
	constraint PK_ServicioLocal primary key nonclustered(
		IdServicioLocal asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.TipoDeConviviente
*/
create table cuidanino.TipoDeConviviente (
	IdTipoDeConviviente					tinyint						,
	TipoDeConviviente					varchar(70)					,
	EstaActivo							bit								 default 1,
	PorDefecto							bit								 default 0,
	constraint PK_TipoDeConviviente primary key nonclustered(
		IdTipoDeConviviente asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.TipoDeLlamadoSinCaso
*/
create table cuidanino.TipoDeLlamadoSinCaso (
	IdTipoDeLlamadoSinCaso				tinyint						,
	TipoDeLlamadoSinCaso				varchar(70)					,
	EstaActivo							bit									 default 1,
	PorDefecto							bit									 default 0,
	Orden								integer						,
	constraint PK_TipoDeLlamadoSinCaso primary key nonclustered(
		IdTipoDeLlamadoSinCaso asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.TipoDeRelacion
*/
create table cuidanino.TipoDeRelacion (
	IdTipoDeRelacion					tinyint						,
	TipoDeRelacion						varchar(70)					,
	EstaActivo							bit									 default 1,
	PorDefecto							bit									 default 0,
	constraint PK_TipoDeRelacion primary key nonclustered(
		IdTipoDeRelacion asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.TipoDeVulneracion
*/
create table cuidanino.TipoDeVulneracion (
	IdTipoDeVulneracion					tinyint						,
	TipoDeVulneracion					varchar(70)					,
	EstaActivo							bit								 default 1,
	PorDefecto							bit								 default 0,
	constraint PK_TipoDeVulneracion primary key nonclustered(
		IdTipoDeVulneracion asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.FormatoEdad
*/
create table cuidanino.FormatoEdad (
	IdFormatoEdad					tinyint							,
	FormatoEdad						varchar(10)						,
	constraint PK_FormatoEdad primary key nonclustered(
		IdFormatoEdad asc)
);
 
/* ------------------------------------------------------------------------------
cuidanino.LlamadoRelacionado
*/
create table cuidanino.LlamadoRelacionado (
	Id									tinyint							,
	IdLlamado							int								,
	IdLlamadoRelacionado				int								,
	constraint PK_LlamadosRelacionado primary key nonclustered(
		Id asc)
);

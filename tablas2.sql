

/* ------------------------------------------------------------------------------
sistemassnya.entidades_serviciozonal
*/
create table sistemassnya.entidades_serviciozonal (
	IdServicioZonal						int(6) unsigned NOT NULL auto_increment,
	ServicioZonal						varchar(50)								,
	CodigoServicioZonal					varchar(50)								,
	EstaActivo							tinyint									,
	PorDefecto							smallint								,	
 [CONSTRAINT [PK_serviciozonal]] UNIQUE [INDEX|KEY]	,
	constraint PK_serviciozonal primary key nonclustered(
		IdServicioZonal asc)
)


/* ------------------------------------------------------------------------------
sistemassnya.entidades_serviciolocal
*/
create table sistemassnya.entidades_serviciolocal (
	IdServicioLocal						int						,
	ServicioLocal						varchar(50)								,
	CodigoServicioLocal					varchar(50)								,
	EstaActivo							tinyint									,
	PorDefecto							smallint								,									,
	constraint PK_entidades_serviciolocal primary key nonclustered(
		IdServicioLocal asc)
)


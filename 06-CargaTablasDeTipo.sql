-- Borro relaciones

ALTER TABLE cuidanino.Llamado DROP FOREIGN KEY FK_Llamado_TipoDeLlamadoSinCaso;
ALTER TABLE cuidanino.Llamado DROP FOREIGN KEY FK_Llamado_TipoDeRelacion;
ALTER TABLE cuidanino.Llamado DROP FOREIGN KEY FK_Llamado_TipoDeVulneracion;
ALTER TABLE cuidanino.Llamado DROP FOREIGN KEY FK_Llamado_TipoDeConviviente;

-- Tabla TipoDeConviviente
DELETE FROM cuidanino.TipoDeConviviente;
INSERT INTO cuidanino.TipoDeConviviente (IdTipoDeConviviente, TipoDeConviviente, EstaActivo, PorDefecto) 
VALUES
(1, 'Familia de origen', 1, 1),
(2, 'Familia ampliada', 1, 0),
(3, 'Referente significativo', 0, 0),
(4, 'Solo', 1, 0),
(5, 'Situaci�n de calle', 1, 0),
(6, 'Institucionalizado', 1, 0),
(7, 'No se pudo determinar', 1, 0),
(8, 'Familia ensamblada', 1, 0),
(9, 'Pareja', 1, 0);

-- Tabla TipoDeLlamadoSinCaso
DELETE FROM cuidanino.TipoDeLlamadoSinCaso;
INSERT INTO cuidanino.TipoDeLlamadoSinCaso (IdTipoDeLlamadoSinCaso, TipoDeLlamadoSinCaso, EstaActivo, PorDefecto, Orden) 
VALUES
(1, 'Muda', 1, 0, 3),
(2, 'Equivocada', 1, 1, 4),
(3, 'Broma / chiste', 1, 0, 2),
(4, 'Promociones', 1, 0, 5),
(5, 'Confusa', 1, 0, 6),
(6, 'Solicita informaci�n acerca del SPPDN', 0, 0, 7),
(8, 'Agresi�n', 1, 0, 1),
(9, 'Asesoramiento', 1, 0, 9),
(10, 'Ligado', 1, 0, 10),
(11, 'Prevenci�n juvenil', 1, 0, 10);

-- Tabla TipoDeRelacion
DELETE FROM cuidanino.TipoDeRelacion;
INSERT INTO cuidanino.TipoDeRelacion (IdTipoDeRelacion, TipoDeRelacion, EstaActivo, PorDefecto) 
VALUES
(1, 'Ni�o/ni�a/adolescente', 1, 1),
(2, 'Madre/Padre', 1, 0),
(3, 'Hermana/o', 1, 0),
(4, 'Abuela/o', 1, 0),
(5, 'T�a/o', 1, 0),
(6, 'Novia/o', 1, 0),
(7, 'Otros familiares', 1, 0),
(8, 'Amiga/o', 1, 0),
(9, 'Pareja', 1, 0),
(10, 'Vecina/o', 1, 0),
(11, 'Docente/Directivo', 1, 0),
(12, 'Empleador', 1, 0),
(13, 'Otro', 1, 0),
(14, 'Familiar indirecto', 1, 0);

-- Tabla TipoDeVulneracion
DELETE FROM cuidanino.TipoDeVulneracion;
INSERT INTO cuidanino.TipoDeVulneracion (IdTipoDeVulneracion, TipoDeVulneracion, EstaActivo, PorDefecto) 
VALUES
(1, 'Violencia Familiar', 1, 1),
(2, 'Maltrato F�sico', 1, 0),
(3, 'Maltrato Ps�quico', 1, 0),
(4, 'Ausencia de representante legal', 1, 0),
(5, 'Abuso Sexual Infantil', 1, 0),
(6, 'Explotaci�n Sexual', 1, 0),
(7, 'Abandono', 1, 0),
(8, 'Ni�o extranjero s/Adulto Responsable', 1, 0),
(9, 'Situaci�n de Calle', 1, 0),
(10, 'Acceso a Educaci�n', 1, 0),
(11, 'Acceso a Salud', 1, 0),
(12, 'Acceso a Vivienda', 1, 0),
(13, 'Acceso a Alimentaci�n', 1, 0),
(14, 'Acceso a Vestimenta', 1, 0),
(15, 'Acceso a Documentaci�n', 1, 0),
(16, 'Consultas Legales', 1, 0),
(17, 'Filiaci�n', 1, 0),
(18, 'Discapacidad', 1, 0),
(19, 'Consumo de  Sustancias.', 1, 0),
(20, 'Explotaci�n Laboral', 1, 0),
(21, 'Discriminaci�n', 1, 0),
(22, 'Embarazo Adolescente.', 1, 0),
(23, 'Negligencia', 1, 0),
(24, 'Discriminaci�n', 1, 0),
(25, 'Trabajo Infantil', 1, 0),
(26, 'Ni�eces disidentes', 1, 0),
(27, 'Ni�os Extraviados', 1, 0),
(28, 'Violencia cibern�tica', 1, 0),
(29, 'Violencia entre ni�os/as', 1, 0),
(30, 'Trata', 1, 0),
(31, '108 - PSC', 1, 0),
(32, 'Solicita informaci�n', 1, 0),
(33, 'Violencia institucional', 1, 0),
(34, 'Acoso sexual en redes', 1, 0);

-- Tabla FormatoEdad
DELETE FROM cuidanino.FormatoEdad;
INSERT INTO cuidanino.FormatoEdad (IdFormatoEdad, FormatoEdad) 
VALUES
(1, 'A�os'),
(2, 'Meses');

-- Creo relaciones
ALTER TABLE cuidanino.Llamado ADD CONSTRAINT FK_Llamado_TipoDeLlamadoSinCaso FOREIGN KEY(LSC_IdTipoDeLlamadoSinCaso) REFERENCES cuidanino.TipoDeLlamadoSinCaso(IdTipoDeLlamadoSinCaso);
ALTER TABLE cuidanino.Llamado ADD CONSTRAINT FK_Llamado_TipoDeRelacion FOREIGN KEY(LCC_IdTipoDeRelacion) REFERENCES cuidanino.TipoDeRelacion(IdTipoDeRelacion);
ALTER TABLE cuidanino.Llamado ADD CONSTRAINT FK_Llamado_TipoDeVulneracion FOREIGN KEY(LCC_IdTipoDeVulneracion) REFERENCES cuidanino.TipoDeVulneracion(IdTipoDeVulneracion);
ALTER TABLE cuidanino.Llamado ADD CONSTRAINT FK_Llamado_TipoDeConviviente FOREIGN KEY(LCC_IdTipoDeConviviente) REFERENCES cuidanino.TipoDeConviviente(IdTipoDeConviviente);

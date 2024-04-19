package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "Derivacion", catalog = "sistemassnya")
@Data
public class Derivacion {
    @Column(name = "IdDerivacion")
    private int idDerivacion;
    @Column(name = "IdServicioLocal")
    private int idServicioLocal;
    @Column(name = "IdServicioZonal")
    private int idServicioZonal;
    @Column(name = "IdTipoDeIntervencion")
    private int idTipoDeIntervencion;
    @Column(name = "idTipoDeVulneracion")
    private int idTipoDeVulneracion;
    @Column(name = "Direccion")
    private String direccion;
    @Column(name = "Municipio")
    private String municipio;
    @Column(name = "Localidad")
    private String localidad;
    @Column(name = "Telefono")
    private String telefono;
    @Column(name = "TelefonoDeGuardia")
    private String telefonoDeGuardia;
    @Column(name = "Referente")
    private String referente;
    @Column(name = "Mail")
    private String mail;
    @Column(name = "Horario")
    private String horario;
    @Column(name = "Observacion")
    private String observacion;
    @Column(name = "EstaActivo")
    private byte estaActivo;
    @Column(name = "PorDefecto")
    private byte porDefecto;
}

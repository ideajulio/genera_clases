package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "Llamado", catalog = "sistemassnya")
@Data
public class Llamado {
    @Column(name = "IdLlamado")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idLlamado;
    @Column(name = "Inicio")
    private Date inicio;
    @Column(name = "Fin")
    private Date fin;
    @Column(name = "IdTelefono")
    private int idTelefono;
    @Column(name = "Observacion")
    private String observacion;
    @Column(name = "IdDiscriminador")
    private String idDiscriminador;
    @Column(name = "LSC_IdTipoDeLlamadoSinCaso")
    private byte lSC_IdTipoDeLlamadoSinCaso;
    @Column(name = "LAG_Agresion")
    private String lAG_Agresion;
    @Column(name = "LCC_IdDomicilio")
    private int lCC_IdDomicilio;
    @Column(name = "LCC_IdLlamante")
    private int lCC_IdLlamante;
    @Column(name = "LCC_IdTipoDeRelacion")
    private byte lCC_IdTipoDeRelacion;
    @Column(name = "LCC_IdTipoDeVulneracion")
    private byte lCC_IdTipoDeVulneracion;
    @Column(name = "LCC_OtraVulneracion")
    private String lCC_OtraVulneracion;
    @Column(name = "LCC_IdTipoDeConviviente")
    private byte lCC_IdTipoDeConviviente;
    @Column(name = "LCC_OtroConviviente")
    private String lCC_OtroConviviente;
    @Column(name = "Usuario")
    private String usuario;
    @Column(name = "Fecha")
    private Date fecha;
    @Column(name = "UsuarioModificacion")
    private String usuarioModificacion;
    @Column(name = "FechaModificacion")
    private Date fechaModificacion;
}

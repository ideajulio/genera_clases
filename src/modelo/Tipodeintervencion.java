package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "TipoDeIntervencion", catalog = "sistemassnya")
@Data
public class Tipodeintervencion {
    @Column(name = "IdTipoDeIntervencion")
    private int idTipoDeIntervencion;
    @Column(name = "IdLlamado")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idLlamado;
    @Column(name = "TipoDeIntervencion")
    private String tipoDeIntervencion;
    @Column(name = "EstaActivo")
    private Object estaActivo;
    @Column(name = "PorDefecto")
    private Object porDefecto;
}

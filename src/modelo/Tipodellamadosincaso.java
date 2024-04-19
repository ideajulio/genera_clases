package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "TipoDeLlamadoSinCaso", catalog = "sistemassnya")
@Data
public class Tipodellamadosincaso {
    @Column(name = "IdTipoDeLlamadoSinCaso")
    private byte idTipoDeLlamadoSinCaso;
    @Column(name = "TipoDeLlamadoSinCaso")
    private String tipoDeLlamadoSinCaso;
    @Column(name = "EstaActivo")
    private Object estaActivo;
    @Column(name = "PorDefecto")
    private Object porDefecto;
    @Column(name = "Orden")
    private Object orden;
}

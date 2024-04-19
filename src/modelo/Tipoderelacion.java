package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "TipoDeRelacion", catalog = "sistemassnya")
@Data
public class Tipoderelacion {
    @Column(name = "IdTipoDeRelacion")
    private byte idTipoDeRelacion;
    @Column(name = "TipoDeRelacion")
    private String tipoDeRelacion;
    @Column(name = "EstaActivo")
    private Object estaActivo;
    @Column(name = "PorDefecto")
    private Object porDefecto;
}

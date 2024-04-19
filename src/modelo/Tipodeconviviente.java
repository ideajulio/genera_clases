package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "TipoDeConviviente", catalog = "sistemassnya")
@Data
public class Tipodeconviviente {
    @Column(name = "IdTipoDeConviviente")
    private byte idTipoDeConviviente;
    @Column(name = "TipoDeConviviente")
    private String tipoDeConviviente;
    @Column(name = "EstaActivo")
    private Object estaActivo;
    @Column(name = "PorDefecto")
    private Object porDefecto;
}

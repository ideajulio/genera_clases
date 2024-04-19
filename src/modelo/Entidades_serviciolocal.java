package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "entidades_serviciolocal", catalog = "sistemassnya")
@Data
public class Entidades_serviciolocal {
    @Column(name = "IdServicioLocal")
    private int idServicioLocal;
    @Column(name = "ServicioLocal")
    private String servicioLocal;
    @Column(name = "CodigoServicioLocal")
    private String codigoServicioLocal;
    @Column(name = "EstaActivo")
    private byte estaActivo;
    @Column(name = "PorDefecto")
    private byte porDefecto;
}

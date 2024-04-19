package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "ServicioLocal", catalog = "sistemassnya")
@Data
public class Serviciolocal {
    @Column(name = "IdServicioLocal")
    private int idServicioLocal;
    @Column(name = "IdServicioZonal")
    private int idServicioZonal;
    @Column(name = "ServicioLocal")
    private String servicioLocal;
    @Column(name = "EstaActivo")
    private Object estaActivo;
    @Column(name = "PorDefecto")
    private Object porDefecto;
}

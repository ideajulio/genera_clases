package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "ServicioZonal", catalog = "sistemassnya")
@Data
public class Serviciozonal {
    @Column(name = "IdServicioZonal")
    private int idServicioZonal;
    @Column(name = "ServicioZonal")
    private String servicioZonal;
    @Column(name = "EstaActivo")
    private Object estaActivo;
    @Column(name = "PorDefecto")
    private Object porDefecto;
}

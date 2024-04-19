package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "entidades_serviciozonal", catalog = "sistemassnya")
@Data
public class Entidades_serviciozonal {
    @Column(name = "IdServicioZonal")
    private int idServicioZonal;
    @Column(name = "ServicioZonal")
    private String servicioZonal;
    @Column(name = "CodigoServicioZonal")
    private String codigoServicioZonal;
    @Column(name = "EstaActivo")
    private byte estaActivo;
    @Column(name = "PorDefecto")
    private byte porDefecto;
}

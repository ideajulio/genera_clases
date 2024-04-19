package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "TipoDeVulneracion", catalog = "sistemassnya")
@Data
public class Tipodevulneracion {
    @Column(name = "IdTipoDeVulneracion")
    private byte idTipoDeVulneracion;
    @Column(name = "TipoDeVulneracion")
    private String tipoDeVulneracion;
    @Column(name = "EstaActivo")
    private Object estaActivo;
    @Column(name = "PorDefecto")
    private Object porDefecto;
}

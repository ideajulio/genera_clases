package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "Llamante", catalog = "sistemassnya")
@Data
public class Llamante {
    @Column(name = "IdLlamante")
    private int idLlamante;
    @Column(name = "Apellidos")
    private String apellidos;
    @Column(name = "Nombres")
    private String nombres;
    @Column(name = "IdMunicipio")
    private byte idMunicipio;
    @Column(name = "IdLocalidad")
    private int idLocalidad;
    @Column(name = "IdBarrio")
    private int idBarrio;
    @Column(name = "IdTelefono")
    private int idTelefono;
}

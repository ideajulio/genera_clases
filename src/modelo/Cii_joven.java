package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "cii_Joven", catalog = "sistemassnya")
@Data
public class Cii_joven {
    @Column(name = "IdJoven")
    private int idJoven;
    @Column(name = "IdLlamado")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idLlamado;
    @Column(name = "Apellidos")
    private String apellidos;
    @Column(name = "Nombres")
    private String nombres;
    @Column(name = "Genero")
    private String genero;
    @Column(name = "IdNacionalidad")
    private byte idNacionalidad;
    @Column(name = "IdNivelEscolar")
    private byte idNivelEscolar;
    @Column(name = "Establecimiento")
    private String establecimiento;
    @Column(name = "Edad")
    private byte edad;
    @Column(name = "Observacion")
    private String observacion;
}

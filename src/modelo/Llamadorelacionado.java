package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "LlamadoRelacionado", catalog = "sistemassnya")
@Data
public class Llamadorelacionado {
    @Column(name = "Id")
    private byte id;
    @Column(name = "IdLlamado")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idLlamado;
    @Column(name = "IdLlamadoRelacionado")
    private int idLlamadoRelacionado;
}

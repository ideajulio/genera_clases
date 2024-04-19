package snya.cii.modelo;

import javax.persistence.*;
import java.util.Date;
import lombok.Data;

@Entity
@Table(name = "FormatoEdad", catalog = "sistemassnya")
@Data
public class Formatoedad {
    @Column(name = "IdFormatoEdad")
    private byte idFormatoEdad;
    @Column(name = "FormatoEdad")
    private String formatoEdad;
}

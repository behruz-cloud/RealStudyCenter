package uz.pdp.study_center.entity;

import jakarta.persistence.*;
import lombok.Data;
@Data
@Entity
public class Groups {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    @ManyToOne
    private Module module;

}

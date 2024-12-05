package uz.pdp.study_center.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    @ManyToOne
    private Groups groups;
    private Integer amount;
}

package uz.pdp.study_center.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Module {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    @ManyToOne
    private Course course;

    public Module(Course course,String name) {
        this.name = name;
        this.course = course;
    }

    public Module() {
    }

    public Module(String name) {
        this.name = name;
    }
}

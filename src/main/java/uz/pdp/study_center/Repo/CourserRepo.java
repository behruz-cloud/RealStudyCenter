package uz.pdp.study_center.Repo;

import jakarta.persistence.EntityManager;
import uz.pdp.study_center.entity.Course;

import java.util.List;

import static uz.pdp.study_center.myListener.MyListener.EMF;

public class CourserRepo {
    public static List<Course> getCoursesList() {
        try (
                EntityManager em = EMF.createEntityManager();

        ) {
            return em.createQuery("select c from Course c", Course.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static List<Object[]> getReport() {
        try (EntityManager em = EMF.createEntityManager()) {
            String query = """
                select c.name, count(s.id), sum(s.amount)
                from Course c
                         join Module m on m.course = c
                         join Groups g on g.module = m
                         join Student s on s.groups = g
                group by c.name
                """;

            return em.createQuery(query, Object[].class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }}
}

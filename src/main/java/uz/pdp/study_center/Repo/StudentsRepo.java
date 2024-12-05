package uz.pdp.study_center.Repo;

import jakarta.persistence.EntityManager;
import uz.pdp.study_center.entity.Groups;
import uz.pdp.study_center.entity.Student;

import java.util.List;

import static uz.pdp.study_center.myListener.MyListener.EMF;


public class StudentsRepo {
    public static List<Student> getStudentsList(int groupId) {
        try (EntityManager em = EMF.createEntityManager()) {
            Groups groups = em.find(Groups.class, groupId);

            if (groups != null) {
                return em.createQuery("SELECT s FROM Student s WHERE s.groups = :groups", Student.class)
                        .setParameter("groups", groups)
                        .getResultList();
            }
            return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

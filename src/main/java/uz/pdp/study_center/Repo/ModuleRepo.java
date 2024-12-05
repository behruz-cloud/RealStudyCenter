package uz.pdp.study_center.Repo;

import jakarta.persistence.EntityManager;
import uz.pdp.study_center.entity.Course;
import uz.pdp.study_center.entity.Module;

import java.util.List;

import static uz.pdp.study_center.myListener.MyListener.EMF;

public class ModuleRepo extends BaseRepo<Module> {
    public static List<Module> getModulesList(Integer id) {
        try (EntityManager em = EMF.createEntityManager()) {
            Course course = em.find(Course.class, id);
            if (course != null) {
                return em.createQuery("select m from Module m where m.course = :course", Module.class)
                        .setParameter("course", course)
                        .getResultList();
            }
            return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Module getById(int moduleId) {
        try (
                EntityManager em = EMF.createEntityManager();
        ) {
            return em.find(Module.class, moduleId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

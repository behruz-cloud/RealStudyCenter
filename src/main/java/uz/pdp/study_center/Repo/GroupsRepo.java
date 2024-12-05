package uz.pdp.study_center.Repo;

import jakarta.persistence.EntityManager;
import uz.pdp.study_center.entity.Groups;
import uz.pdp.study_center.entity.Module;

import java.util.List;

import static uz.pdp.study_center.myListener.MyListener.EMF;

public class GroupsRepo {
    public static List<Groups> getGroupsList(int moduleId) {


        try (EntityManager em = EMF.createEntityManager()) {
            Module module = em.find(Module.class, moduleId);

            if (module != null) {
                return em.createQuery("SELECT g FROM Groups g WHERE g.module = :module", Groups.class)
                        .setParameter("module", module)
                        .getResultList();
            }
            return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Groups getById(int groupId) {
        try (
                EntityManager em = EMF.createEntityManager();

        ) {
            return em.find(Groups.class, groupId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

package uz.pdp.study_center.Repo;

import jakarta.persistence.EntityManager;

import static uz.pdp.study_center.myListener.MyListener.EMF;

public class BaseRepo<T> {
    public void save(T entity) {
        try (
                EntityManager em = EMF.createEntityManager();
        ) {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

package uz.pdp.study_center.servlet;

import jakarta.persistence.EntityManager;
import uz.pdp.study_center.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.study_center.myListener.MyListener.EMF;

@WebServlet("/payment")
public class AddPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager em = EMF.createEntityManager()
        ) {
            Integer studentId = Integer.parseInt(req.getParameter("studentId"));
            Integer amount = Integer.parseInt(req.getParameter("amount"));
            em.getTransaction().begin();
            Student student = em.find(Student.class, studentId);
            student.setAmount(student.getAmount() + amount);
            em.persist(student);
            req.getSession().setAttribute("student", student);
            em.getTransaction().commit();
            resp.sendRedirect("/Successful.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

//package uz.pdp.car_web_app.servlets;
//
//import jakarta.persistence.EntityManager;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;
//import uz.pdp.car_web_app.entity.Attachment;
//import uz.pdp.car_web_app.entity.AttachmentContent;
//
//import java.io.IOException;
//import java.util.UUID;
//
//import static uz.pdp.car_web_app.config.DBConfig.entityManager;
//import static uz.pdp.car_web_app.config.DBConfig.entityManagerFactory;
//
//@MultipartConfig
//@WebServlet(name = "file", value = "/file")
//public class FileServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        EntityManager entityManager = entityManagerFactory.createEntityManager();
//        UUID attachmentId = UUID.fromString(req.getParameter("id"));
//
//        AttachmentContent attachmentContent = entityManager.createQuery("select u from AttachmentContent u where u.attachment.id=:id ", AttachmentContent.class)
//                .setParameter("id", attachmentId).getSingleResult();
//
//        resp.getOutputStream().write(attachmentContent.getContent() );
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        EntityManager entityManager = entityManagerFactory.createEntityManager();
//        entityManager.getTransaction().begin();
//        Part part = req.getPart("file");
//        byte[] bytes = part.getInputStream().readAllBytes();
//        String fileName = part.getSubmittedFileName();
//
//        String contentType = fileName.substring(fileName.lastIndexOf("."));
//
//        AttachmentContent attachmentContent = AttachmentContent.builder()
//                .attachment(
//                        Attachment.builder()
//                                .contentType(contentType)
//                                .build()
//                )
//                .content(bytes)
//                .build();
//
//        entityManager.persist(attachmentContent );
//        req.getSession().setAttribute("attachmentId", attachmentContent.getId());
//
//        entityManager.getTransaction().commit();
//        resp.sendRedirect(req.getParameter("redirection"));
//
//    }
//}

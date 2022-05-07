package projectel.projectel;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SaveGradeServlet", value = "/SaveGradeServlet")
public class SaveGradeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       request.getParameter("grade");
       System.out.println("grade="+request.getParameter("grade"));
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getParameter("grade");
        System.out.println("grade="+request.getParameter("grade"));
    }

}

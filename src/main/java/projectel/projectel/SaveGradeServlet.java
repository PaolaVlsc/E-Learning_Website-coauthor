package projectel.projectel;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "SaveGradeServlet", value = "/SaveGradeServlet")
public class SaveGradeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getParameter("grade");
        System.out.println("grade="+request.getParameter("hiddenField"));
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        System.out.println("grade with post="+request.getParameter("grade"));
        Connection conn = DbConnection.getConnection();
        if(conn==null || !Login.isLoggedIn(request.getSession())) return;
        try {
            PreparedStatement statement = conn.prepareStatement("INSERT INTO grades (chapter_id,user_id,grade) VALUES (?,?,?) ");
            statement.setString(1,request.getParameter("chapter"));
            statement.setString(2,Login.getUserId(request.getSession()));
            statement.setString(3,request.getParameter("grade"));
            statement.executeUpdate();
        } catch (SQLException e) {
            response.sendRedirect("html/error.html");
        }
    }

}

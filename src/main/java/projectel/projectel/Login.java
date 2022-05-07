package projectel.projectel;

import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {

    //Ελέγχει τα διαπιστευτήρια του χρήστη και επιστρέφει το user id αν είναι σωστά αλλιώς null.
    static public Boolean checkCredentials(final String email,final String password, final HttpSession session){
        Connection conn = DbConnection.getConnection();
        if (conn==null) return false;
        try {
            final PreparedStatement dbStmt = conn.prepareStatement("SELECT id,name FROM users WHERE password=? AND email=?;");
            dbStmt.setString(1, password);
            dbStmt.setString(2, email);
            dbStmt.execute();
            final ResultSet dbRs = dbStmt.executeQuery();
            if (dbRs.next()) {
                session.setAttribute("userId",dbRs.getString(1)); //Επιστροφή του user id
                session.setAttribute("userName",dbRs.getString(2));
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; //Αποτυχία σύνδεσης με βάση ή τα στοιχεία δεν είναι σωστά
    }

    static public boolean isLoggedIn(final HttpSession session){
        return session.getAttribute("userId")!=null;
    }

    static public String getUserId(final HttpSession session){
        return (String) session.getAttribute("userId");
    }

    static public String getUserName(final HttpSession session){
        return (String) session.getAttribute("userName");
    }
}

package projectel.projectel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {

    //Ελέγχει τα διαπιστευτήρια του χρήστη και επιστρέφει το user id αν είναι σωστά αλλιώς null.
    static public String checkCredentials(final String email,final String password ){
        Connection conn = DbConnection.getConnection();
        if (conn==null) return null;
        try {
            final PreparedStatement dbStmt = conn.prepareStatement("SELECT id FROM users WHERE password=? AND email=?;");
            dbStmt.setString(1, password);
            dbStmt.setString(2, email);
            dbStmt.execute();
            final ResultSet dbRs = dbStmt.executeQuery();
            if (dbRs.next()) {
                return dbRs.getString(1); //Επιστροφή του user id
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; //Αποτυχία σύνδεσης με βάση ή τα στοιχεία δεν είναι σωστά
    }
}

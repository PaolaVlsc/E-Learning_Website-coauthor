package projectel.projectel;

import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Statistics {

    //Ελέγχει τα διαπιστευτήρια του χρήστη και επιστρέφει το user id αν είναι σωστά αλλιώς null.
    static public String getMaxGrades(final int id,final int chapter ){
        Connection conn = DbConnection.getConnection();
        if (conn==null) return null;
        try {
            final PreparedStatement ps = conn.prepareStatement("SELECT MAX(grade) FROM grades WHERE user_id=? AND chapter_id=?");
            ps.setInt(1, id);
            ps.setInt(2, chapter);
            ps.execute();
            final ResultSet dbRs = ps.executeQuery();
            if (dbRs.next()) {
                System.out.println(dbRs.getString(1));
                return dbRs.getString(1); //Επιστροφή του βαθμού
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; //Αποτυχία σύνδεσης με βάση ή τα στοιχεία δεν είναι σωστά
    }
    static public List<Integer> getAllChapterGrades(final int id, final int chapter ){
        List<Integer> list = new ArrayList<>();
        Connection con = DbConnection.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT grade FROM grades WHERE user_id=? AND chapter_id=?");
            ps.setInt(1, id);
            ps.setInt(2, chapter);
            ps.execute();
            ResultSet dbRs = ps.executeQuery();
            while (dbRs.next()){
                System.out.println(dbRs.getInt(1));
                list.add(dbRs.getInt(1));
            }
            con.close();
        } catch (SQLException ex) {
        }
        return list;
    }

}

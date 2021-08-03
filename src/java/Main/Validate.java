package Main;

import Object.Current;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Validate {

    private static DBAccess dbAccess;
    public static int checkUser(String email, String password) throws Exception {

        //Setup database access object
        DBAccess dbAccess = new DBAccess();
        Validate.dbAccess = dbAccess;

        PreparedStatement ps = dbAccess.getConnection().prepareStatement("select Password from Person where Email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (password.equals(rs.getString("Password"))) {
                Current.user = dbAccess.setUpPerson(email);

                //User logged in
                return 1;
            } else {
                //Incorrect Password
                return 0;
            }
        } else {
            dbAccess.Terminate();
            //Email not Registered
            return -1;
        }
    }

    public static boolean checkPassword(String email, String password) throws Exception {
        PreparedStatement ps = dbAccess.getConnection().prepareStatement("select Password from Person where Email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (password.equals(rs.getString("Password"))){
                return true;
            }
            return false;
        }
        else{
            throw new Exception("Email not found in Database!");
        }
    }
}

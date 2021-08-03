package Main;

import Object.Person;
import Object.Profile;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class DBAccess {

    private Connection con = null;

    public DBAccess() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/DatingDB", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public void Terminate(){
        try{
            con.close();
        }
        catch(Exception e){}
    }
    
    
    public boolean changePassword(String email, String password)throws Exception{
        PreparedStatement ps = con.prepareStatement("UPDATE Person SET Password = ? where Email = ?");
        ps.setString(1, password);
        ps.setString(2, email);
        return ps.executeUpdate() == 1;
    }
    public void deleteUserAccount(String SSN) {
        try {
            PreparedStatement st = con.prepareStatement("Delete from Person where SSN = ?");
            st.setString(1, SSN);
            st.executeUpdate();
            st = con.prepareStatement("Delete from User where SSN = ?");
            st.setString(1, SSN);
            st.executeUpdate();
            st = con.prepareStatement("Delete from Profile where OwnerSSN = ?");
            st.setString(1, SSN);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getSSNFromName(String lname, String fname) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT SSN FROM Person WHERE Person.LastName = ? AND Person.FirstName = ?");
        ps.setString(1, lname);
        ps.setString(2, fname);
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs.getString("SSN");
    }

    public ResultSet listAllUsers() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM User");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet getProfileSSN(String profileID) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT OwnerSSN FROM Profile WHERE Profile.ProfileID = ?");
        ps.setString(1, profileID);
        return ps.executeQuery();
    }

    public ResultSet getPrivateInfoFromProfile(String pID) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Person WHERE Person.SSN IN(SELECT OwnerSSN FROM Profile WHERE Profile.ProfileID = ?)");
        ps.setString(1, pID);
        return ps.executeQuery();
    }

    public String getEmailFromProfile(String pID) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Person WHERE Person.SSN IN(SELECT OwnerSSN FROM Profile WHERE Profile.ProfileID = ?)");
        ps.setString(1, pID);
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs.getString("Email");
    }

    public boolean checkEmployee(String SSN) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Employee WHERE Employee.SSN = ?");
        ps.setString(1, SSN);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    }

    public boolean updatePass(String SSN, String oldPass, String pass1, String pass2) throws SQLException {
        if (pass1.compareTo(pass2) != 0) {
            System.out.println("new passwords don't match");
            return false;
        }
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Person WHERE Person.Password = ?");
        ps.setString(1, oldPass);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            PreparedStatement ps2 = con.prepareStatement("UPDATE Person SET Password = ? WHERE Person.SSN = ?");
            ps2.setString(1, pass1);
            ps2.setString(2, SSN);
            ps2.executeUpdate();
            return true;
        } else {
            System.out.println("The old password was incorrect");
            return false;
        }
    }

    public ResultSet getAllProfileIDs() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT ProfileID FROM Profile");
        return ps.executeQuery();
    }

    public void addCustomer(String SSN, String email, String profileID, String pass1, String fname, String lname, String city, String region, String phone) throws SQLException {
        PreparedStatement ps2 = con.prepareStatement("INSERT INTO Person(SSN, Password, FirstName, LastName, City, Region, Email, Telephone, Username) VALUES (?,?,?,?,?,?,?,?,?)");
        ps2.setString(1, SSN);
        ps2.setString(2, pass1);
        ps2.setString(3, fname);
        ps2.setString(4, lname);
        ps2.setString(5, city);
        ps2.setString(6, region);
        ps2.setString(7, email);
        ps2.setString(8, phone);
        ps2.setString(9, profileID);
        ps2.executeUpdate();

        PreparedStatement ps3 = con.prepareStatement("INSERT INTO User(SSN, DateOfLastAct) VALUES (?, NOW())");
        ps3.setString(1, SSN);
        ps3.executeUpdate();

        PreparedStatement ps4 = con.prepareStatement("INSERT INTO Profile(ProfileID, OwnerSSN, CreationDate, LastModDate) VALUES (?, ?,NOW(),NOW())");
        ps4.setString(1, profileID);
        ps4.setString(2, SSN);
        ps4.executeUpdate();
    }

    public void updateCustomer(String SSN, int age, int dars, int dare, int dgr, String gender, String hobbies, int height, int weight, String hair) throws SQLException {
        PreparedStatement ps4 = con.prepareStatement("UPDATE Profile SET Age = ?, DatingAgeRangeStart = ?, DatingAgeRangeEnd = ?, DatingGeoRange = ?, M_F = ?, Hobbies = ?, Height = ?, Weight = ?, HairColor = ?, LastModDate = NOW() WHERE OwnerSSN = ?");
        ps4.setInt(1, age);
        ps4.setInt(2, dars);
        ps4.setInt(3, dare);
        ps4.setInt(4, dgr);
        ps4.setString(5, gender);
        ps4.setString(6, hobbies);
        ps4.setInt(7, height);
        ps4.setInt(8, weight);
        ps4.setString(9, hair);
        ps4.setString(10, SSN);
        ps4.executeUpdate();
    }

    public ResultSet getProfileInfo(String profileID) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Profile WHERE Profile.ProfileID = ?");
        ps.setString(1, profileID);
        return ps.executeQuery();
    }

    public ResultSet getPrivateInfo(String SSN) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Person WHERE Person.SSN = ?");
        ps.setString(1, SSN);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet getCustomerEmails() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT Email FROM Person WHERE Person.SSN IN (SELECT SSN FROM User)");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet getCustomerAddresses() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT Street, City, State, ZipCode FROM Person WHERE Person.SSN IN (SELECT SSN FROM User)");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet getCustomerPhones() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT Telephone FROM Person WHERE Person.SSN IN (SELECT SSN FROM User)");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet searchByFeature(String feature, String input) throws SQLException {
        if (feature.compareTo("Age") != 0 && feature.compareTo("HairColor") != 0 && feature.compareTo("Height") != 0 && feature.compareTo("Weight") != 0) {
            return null;
        } else {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Profile WHERE Profile." + feature + " = ?");
            ps.setString(1, input);
            return ps.executeQuery();
        }
    }

    public ResultSet searchProfilesByLocation(String city) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Profile WHERE Profile.OwnerSSN IN (SELECT SSN FROM Person WHERE Person.City = ?)");
        ps.setString(1, city);
        return ps.executeQuery();
    }

    public ResultSet mostActiveProfile() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT ProfileID, OwnerSSN, LastModDate "
                + "From Profile WHERE Profile.OwnerSSN In(SELECT "
                + "OwnerSSN FROM Profile WHERE Profile.LastModDate "
                + ">= ALL(SELECT LastModDate FROM Profile)");
        return ps.executeQuery();
    }

    public Profile setUpProfile(String SSN) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Profile WHERE Profile.OwnerSSN = ?");
        ps.setString(1, SSN);
        ResultSet resultSet = ps.executeQuery();
        resultSet.next();
        
        Profile profile = new Profile();
        
        profile.setProfileid(resultSet.getString("ProfileID"));
        profile.setOwnerSSN(resultSet.getString("OwnerSSN"));
        profile.setAge(resultSet.getInt("Age"));
        profile.setDars(resultSet.getInt("DatingAgeRangeStart"));
        profile.setDare(resultSet.getInt("DatingAgeRangeEnd"));
        profile.setDgr(resultSet.getInt("DatingGeoRange"));
        profile.setM_f(resultSet.getString("M_F"));
        profile.setHobbies(resultSet.getString("Hobbies"));
        profile.setHeight(resultSet.getInt("Height"));
        profile.setWeight(resultSet.getInt("Weight"));
        profile.setHairColor(resultSet.getString("HairColor"));
        if(resultSet.getBoolean("ProfilePic")){
            profile.setProfilepic("assets/img/" + SSN + ".jpg");
        }
        else{
            profile.setProfilepic("assets/img/default.jpg");
        }
        
        return profile;
    }
    
    public Person setUpPerson(String Email) throws Exception{
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Person WHERE Person.Email = ?");
        ps.setString(1, Email);
        ResultSet resultSet = ps.executeQuery();
        resultSet.next();
        
        Person person = new Person();
        
        person.setDBAccess(this);
        
        person.setEmail(resultSet.getString("Email"));
        person.setSSN(resultSet.getString("SSN"));
        person.setFirstName(resultSet.getString("FirstName"));
        person.setLastName(resultSet.getString("LastName"));
        person.setTelephone(resultSet.getString("Telephone"));
        person.setCity(resultSet.getString("City"));
        person.setRegion(resultSet.getString("Region"));
        
        person.setProfile(setUpProfile(person.getSSN()));
        
        return person;
    }

    public Connection getConnection() {
        return con;
    }
}

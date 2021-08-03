package Object;

import Main.DBAccess;
import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Profile implements Serializable {

    private String profilepic;
    private String profileid;
    private String ownerSSN;
    private String fullname;
    private int age;
    private int dars;
    private int dare;
    private int dgr;
    private String m_f;
    private String hobbies;
    private int height; //In cm
    private int weight;
    private String haircolor;
    private boolean hasProfilePic;

    public Profile() {
        //Default values
        profileid = "";
        fullname = "";
        ownerSSN = "";
        age = 0;
        dars = 0;
        dare = 0;
        dgr = 0;
        m_f = "";
        hobbies = "";
        height = 0;
        haircolor = "";
        height = 0;
        hasProfilePic = false;
        profilepic = "";
    }

    public void setProfilepic(String path) {
        this.profilepic = path;
    }

    public String getProfilepic() {
        return profilepic;
    }

    public void hasProfilepic(boolean val) {
        this.hasProfilePic = val;
    }

    public boolean hasProfilepic() {
        return hasProfilePic;
    }

    public String getProfileid() {
        return profileid;
    }

    public void setProfileid(String prof) {
        profileid = prof;
    }

    public String getOwnerSSN() {
        return ownerSSN;
    }

    public void setOwnerSSN(String ownerSSN) {
        this.ownerSSN = ownerSSN;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getDars() {
        return dars;
    }

    public void setDars(int datingAgeRangeStart) {
        dars = datingAgeRangeStart;
    }

    public int getDare() {
        return dare;
    }

    public void setDare(int datingAgeRangeEnd) {
        dare = datingAgeRangeEnd;
    }

    public int getDgr() {
        return dgr;
    }

    public void setDgr(int datingGeoRange) {
        dgr = datingGeoRange;
    }

    public String getM_f() {
        return m_f;
    }

    public void setM_f(String m_F) {
        m_f = m_F;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getHaircolor() {
        return haircolor;
    }

    public void setHairColor(String haircolor) {
        this.haircolor = haircolor;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getFullname() {
        return fullname;
    }
}

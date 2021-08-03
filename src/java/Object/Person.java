/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import Main.DBAccess;

/**
 *
 * @author E6440
 */
public class Person {

    private String SSN;
    private String Email;
    private String FirstName;
    private String LastName;
    private String City;
    private String Region;
    private String Telephone;
    private Profile profile;
    private DBAccess dbAccess;

    public Person() {
         SSN = "";
         Email = "";
         FirstName = "";
         LastName = "";
         City = "";
         Region = "";
         Telephone = "";
    }

    public void setProfile(Profile profile){
        this.profile = profile;
    }
    public void setSSN(String SSN) {
        this.SSN = SSN;
    }
    
    public void setDBAccess(DBAccess dbAccess){
        this.dbAccess = dbAccess;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public void setRegion(String Region) {
        this.Region = Region;
    }

    public void setTelephone(String Telephone) {
        this.Telephone = Telephone;
    }


    public String getSSN() {
        return SSN;
    }

    public String getEmail() {
        return Email;
    }

    public String getFirstName() {
        return FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public String getCity() {
        return City;
    }

    public String getRegion() {
        return Region;
    }

    public String getTelephone() {
        return Telephone;
    }

    
    public Profile getProfile(){
        return profile;
    }

    public DBAccess getDBAccess(){
        return dbAccess;
    }

}

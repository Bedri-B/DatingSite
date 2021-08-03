/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

/**
 *
 * @author E6440
 */
public class Current {
    public static Person user = null;
    public static void Logout(){
        user.getDBAccess().Terminate();
        user = null;
    } 
}

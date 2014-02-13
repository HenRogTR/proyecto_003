/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import dao_dn.Extra;

/**
 *
 * @author Henrri
 */
public class aExtra {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Extra objExtra = new Extra();
        objExtra.setCodigo("sds");
        objExtra.setLetra("dfdfd");
        objExtra.setRegistro("sdfsds");
        
        System.out.println(new cExtra().crear(objExtra));
    }

}

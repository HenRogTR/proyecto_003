/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import dao_dn.Extra;
import java.util.List;

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
        List l=new cDN().leer();
        System.out.println(l.size());
    }

}

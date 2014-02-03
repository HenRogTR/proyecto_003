/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao_dn;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.stat.Statistics;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author Henrri
 */
public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    private static Statistics stats;

    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            // sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
            Configuration cfg = new Configuration();
            
            sessionFactory = cfg.configure("hibernate.cfg.xml").buildSessionFactory();
            stats = sessionFactory.getStatistics();
            stats.setStatisticsEnabled(true);
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}

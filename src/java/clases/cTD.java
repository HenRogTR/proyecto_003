/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import dao_dn.DocumentoNotificacion;
import dao_dn.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Henrri
 */
public class cTD {

    Session sesion = null;
    String error = null;

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public Session getSesion() {
        return sesion;
    }

    public void setSesion(Session sesion) {
        this.sesion = sesion;
    }

    public Boolean crear(DocumentoNotificacion objDN) {
        Boolean est = false;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            sesion.saveOrUpdate(objDN);
            sesion.getTransaction().commit();
        } catch (Exception e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return est;
    }

    public DocumentoNotificacion leer_cod(Integer codDocumentoNotificacion) {
        DocumentoNotificacion obj = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from User where id = :id");
            q.setInteger("id", codDocumentoNotificacion);
            obj = (DocumentoNotificacion) q.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return obj;
    }

    public List leer_coincidencia(String term) {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("")
                    .setParameter("term", "%" + term.replace(" ", "%") + "%");
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public List leer_entregados() {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("");
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }
}

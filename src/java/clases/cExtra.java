/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import dao_dn.Extra;
import dao_dn.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utilitarios.cOtros;


/**
 *
 * @author Henrri
 */
public class cExtra {

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
        this.sesion = null;
    }

    public Integer crear(Extra objE) {
        Integer cod = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            cod = (Integer) sesion.save(objE);
            sesion.getTransaction().commit();
        } catch (Exception e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {
            sesion.flush();
            sesion.close();
        }
        return cod;
    }
    
    /**
     *
     * @param codExtra
     * @param tipo sucursal, propietario,marca, estado
     * @return
     */
    public Extra leer_cod(Integer codExtra) {
        Extra obj = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from Extra e "
                    + "where e.codExtra = :param1 ")
                    .setInteger("param1", codExtra);
            obj = (Extra) q.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return obj;
    }

    /**
     *
     * @param tipo
     * @return
     */
    public List leer(String tipo) {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from Extra e "
                    + "where e.codigo= :tipo")
                    .setParameter("tipo", tipo);
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public Integer leer_primero(String tipo) {
        Integer codExtraInteger = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select e.codExtra "
                    + "from Extra e "
                    + "where substring(e.registro,1,1)=1 "
                    + "and e.codigo= :tipo "
                    + "order by e.codExtra asc")
                    .setParameter("tipo", tipo)
                    .setMaxResults(1);
            codExtraInteger = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return codExtraInteger;
    }

    public Integer leer_anterior(Integer codExtra, String tipo) {
        Integer cE = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select e.codExtra "
                    + "from Extra e "
                    + "where substring(e.registro,1,1)=1 "
                    + "and e.codigo= :tipo "
                    + "and e.codExtra < :term1 "
                    + "order by e.codigo desc")
                    .setParameter("tipo", tipo)
                    .setParameter("term1", codExtra)
                    .setMaxResults(1);
            cE = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return cE;
    }

    public Integer leer_siguiente(Integer codExtra, String tipo) {
        Integer cE = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select e.codExtra "
                    + "from Extra e "
                    + "where substring(e.registro,1,1)=1 "
                    + "and e.codigo= :tipo "
                    + "and e.codExtra > :term1 "
                    + "order by e.codigo asc")
                    .setParameter("tipo", tipo)
                    .setParameter("term1", codExtra)
                    .setMaxResults(1);
            cE = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return cE;
    }

    public Integer leer_ultimo(String tipo) {
        Integer codExtraInteger = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select e.codExtra "
                    + "from Extra e "
                    + "where substring(e.registro,1,1)=1 "
                    + "and e.codigo= :tipo "
                    + "order by e.codExtra desc")
                    .setParameter("tipo", tipo)
                    .setMaxResults(1);
            codExtraInteger = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return codExtraInteger;
    }
    
    public Boolean actualizar(Extra objExtra) {
        Boolean est = false;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            sesion.update(objExtra);
            sesion.getTransaction().commit();
            est = true;
        } catch (Exception e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {
            sesion.flush();
            sesion.close();
        }
        return est;
    }

    public Boolean actualizar_registro(Integer codExtra, String estado) {
        Boolean est = false;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Extra obj = (Extra) sesion.get(Extra.class, codExtra);
            obj.setRegistro(new cOtros().registro(estado, 1) + "/" + obj.getRegistro());
            sesion.update(obj);
            sesion.getTransaction().commit();
            est = true;
        } catch (Exception e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
            setError("Tabla_actualizar_registro: " + e.getMessage());
        } finally {
            sesion.flush();
            sesion.close();
        }
        return est;
    }
}
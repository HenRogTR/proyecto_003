/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import dao_dn.DocumentoNotificacion;
import dao_dn.HibernateUtil;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utilitarios.cOtros;

/**
 *
 * @author Henrri
 */
public class cDN {

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

    public Integer crear(DocumentoNotificacion objDN) {
        Integer cod = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            cod = (Integer) sesion.save(objDN);
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

    public List leer() {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from DocumentoNotificacion");
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public List leer_por_propietario(String propietario) {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from DocumentoNotificacion dn "
                    + "where dn.propietario = :propietario")
                    .setParameter("propietario", propietario);
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public List leer_por_sucursal(String sucursal) {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from DocumentoNotificacion dn "
                    + "where dn.sucursal = :sucursal")
                    .setParameter("sucursal", sucursal);
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public List leer_por_marca(String marca) {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from DocumentoNotificacion dn "
                    + "where dn.marca = :marca")
                    .setParameter("marca", marca);
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public List leer_por_estado(String estado) {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from DocumentoNotificacion dn "
                    + "where dn.estado = :estado")
                    .setParameter("estado", estado);
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public List leer_por_estado2(String estado) {
        List l = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from DocumentoNotificacion dn "
                    + "where dn.estado = :estado "
                    + "and substring(dn.registro,1,1)=1")
                    .setParameter("estado", estado);
            l = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return l;
    }

    public DocumentoNotificacion leer_cod(Integer codDocumentoNotificacion) {
        DocumentoNotificacion obj = null;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("from DocumentoNotificacion dn where dn.codDocumentoNotificacion = :param1");
            q.setInteger("param1", codDocumentoNotificacion);
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
            Query q = sesion.createQuery("from DocumentoNotificacion dn "
                    + "where (dn.cliente like :term)")
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

    public Integer leer_primero() {
        Integer cDN = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select dn.codDocumentoNotificacion "
                    + "from DocumentoNotificacion dn "
                    + "where substring(dn.registro,1,1)=1 "
                    + "order by dn.codDocumentoNotificacion asc")
                    .setMaxResults(1);
            cDN = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return cDN;
    }

    public Integer leer_anterior(Integer codDocumentoNotificacion) {
        Integer cDN = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select dn.codDocumentoNotificacion "
                    + "from DocumentoNotificacion dn "
                    + "where substring(dn.registro,1,1)=1 "
                    + "and dn.codDocumentoNotificacion < :term1 "
                    + "order by dn.codDocumentoNotificacion desc")
                    .setParameter("term1", codDocumentoNotificacion)
                    .setMaxResults(1);
            cDN = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return cDN;
    }

    public Integer leer_siguiente(Integer codDocumentoNotificacion) {
        Integer cDN = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select dn.codDocumentoNotificacion "
                    + "from DocumentoNotificacion dn "
                    + "where substring(dn.registro,1,1)=1 "
                    + "and dn.codDocumentoNotificacion > :term1 "
                    + "order by dn.codDocumentoNotificacion asc")
                    .setParameter("term1", codDocumentoNotificacion)
                    .setMaxResults(1);
            cDN = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return cDN;
    }

    public Integer leer_ultimo() {
        Integer cDN = 0;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            Query q = sesion.createQuery("select dn.codDocumentoNotificacion "
                    + "from DocumentoNotificacion dn "
                    + "where substring(dn.registro,1,1)=1 "
                    + "order by dn.codDocumentoNotificacion desc")
                    .setMaxResults(1);
            cDN = (Integer) q.list().iterator().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sesion.flush();
            sesion.close();
        }
        return cDN;
    }

    public Boolean actualizar(DocumentoNotificacion objDN) {
        Boolean est = false;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            sesion.update(objDN);
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

    public Boolean actualizar_registro(Integer codDocumentoNotificacion, String estado) {
        Boolean est = false;
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            DocumentoNotificacion obj = (DocumentoNotificacion) sesion.get(DocumentoNotificacion.class, codDocumentoNotificacion);
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

    public Boolean actualizar_sucursal(String sucursal, String sucursalNuevo) {
        Boolean est = false;
        List DNList = new cDN().leer_por_sucursal(sucursal);
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            for (Iterator it = DNList.iterator(); it.hasNext();) {
                DocumentoNotificacion objDN = (DocumentoNotificacion) it.next();
                DocumentoNotificacion objDNActualizar = new cDN().leer_cod(objDN.getCodDocumentoNotificacion());
                objDNActualizar.setSucursal(sucursalNuevo);
                sesion.update(objDNActualizar);
            }
            sesion.getTransaction().commit();
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

    public Boolean actualizar_propietario(String propietario, String propietarioNuevo) {
        Boolean est = false;
        List DNList = new cDN().leer_por_propietario(propietario);
        System.out.println("tamanio con propietario igual:" + DNList.size());
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            for (Iterator it = DNList.iterator(); it.hasNext();) {
                DocumentoNotificacion objDN = (DocumentoNotificacion) it.next();
                DocumentoNotificacion objDNActualizar = new cDN().leer_cod(objDN.getCodDocumentoNotificacion());
                objDNActualizar.setPropietario(propietarioNuevo);
                sesion.update(objDNActualizar);
            }
            sesion.getTransaction().commit();
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

    public Boolean actualizar_marca(String marca, String marcaNuevo) {
        Boolean est = false;
        List DNList = new cDN().leer_por_marca(marca);
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            for (Iterator it = DNList.iterator(); it.hasNext();) {
                DocumentoNotificacion objDN = (DocumentoNotificacion) it.next();
                DocumentoNotificacion objDNActualizar = new cDN().leer_cod(objDN.getCodDocumentoNotificacion());
                objDNActualizar.setMarca(marcaNuevo);
                sesion.update(objDNActualizar);
            }
            sesion.getTransaction().commit();
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

    public Boolean actualizar_estado(String estado, String estadoNuevo) {
        Boolean est = false;
        List DNList = new cDN().leer_por_estado(estado);
        Transaction trns = null;
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            trns = sesion.beginTransaction();
            for (Iterator it = DNList.iterator(); it.hasNext();) {
                DocumentoNotificacion objDN = (DocumentoNotificacion) it.next();
                DocumentoNotificacion objDNActualizar = new cDN().leer_cod(objDN.getCodDocumentoNotificacion());
                objDNActualizar.setEstado(estadoNuevo);
                sesion.update(objDNActualizar);
            }
            sesion.getTransaction().commit();
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

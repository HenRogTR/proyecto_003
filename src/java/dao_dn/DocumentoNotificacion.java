package dao_dn;
// Generated 31/01/2014 11:29:03 AM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * DocumentoNotificacion generated by hbm2java
 */
public class DocumentoNotificacion  implements java.io.Serializable {


     private Integer codDocumentoNotificacion;
     private String propietario;
     private String sucursal;
     private String placaNumero;
     private String tituloNumero;
     private String marca;
     private String motorNumero;
     private String chasisNumero;
     private String carroceria;
     private Date fechaEntrega;
     private String observacion;
     private String registro;

    public DocumentoNotificacion() {
    }

	
    public DocumentoNotificacion(String registro) {
        this.registro = registro;
    }
    public DocumentoNotificacion(String propietario, String sucursal, String placaNumero, String tituloNumero, String marca, String motorNumero, String chasisNumero, String carroceria, Date fechaEntrega, String observacion, String registro) {
       this.propietario = propietario;
       this.sucursal = sucursal;
       this.placaNumero = placaNumero;
       this.tituloNumero = tituloNumero;
       this.marca = marca;
       this.motorNumero = motorNumero;
       this.chasisNumero = chasisNumero;
       this.carroceria = carroceria;
       this.fechaEntrega = fechaEntrega;
       this.observacion = observacion;
       this.registro = registro;
    }
   
    public Integer getCodDocumentoNotificacion() {
        return this.codDocumentoNotificacion;
    }
    
    public void setCodDocumentoNotificacion(Integer codDocumentoNotificacion) {
        this.codDocumentoNotificacion = codDocumentoNotificacion;
    }
    public String getPropietario() {
        return this.propietario;
    }
    
    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }
    public String getSucursal() {
        return this.sucursal;
    }
    
    public void setSucursal(String sucursal) {
        this.sucursal = sucursal;
    }
    public String getPlacaNumero() {
        return this.placaNumero;
    }
    
    public void setPlacaNumero(String placaNumero) {
        this.placaNumero = placaNumero;
    }
    public String getTituloNumero() {
        return this.tituloNumero;
    }
    
    public void setTituloNumero(String tituloNumero) {
        this.tituloNumero = tituloNumero;
    }
    public String getMarca() {
        return this.marca;
    }
    
    public void setMarca(String marca) {
        this.marca = marca;
    }
    public String getMotorNumero() {
        return this.motorNumero;
    }
    
    public void setMotorNumero(String motorNumero) {
        this.motorNumero = motorNumero;
    }
    public String getChasisNumero() {
        return this.chasisNumero;
    }
    
    public void setChasisNumero(String chasisNumero) {
        this.chasisNumero = chasisNumero;
    }
    public String getCarroceria() {
        return this.carroceria;
    }
    
    public void setCarroceria(String carroceria) {
        this.carroceria = carroceria;
    }
    public Date getFechaEntrega() {
        return this.fechaEntrega;
    }
    
    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }
    public String getObservacion() {
        return this.observacion;
    }
    
    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }
    public String getRegistro() {
        return this.registro;
    }
    
    public void setRegistro(String registro) {
        this.registro = registro;
    }




}


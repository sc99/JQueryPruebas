
package Clases;

import java.sql.ResultSet;
import java.sql.SQLException;

public class cAlumnos {
    
    private int _cantAlumn;

    public int getCantAlumn() {
        return _cantAlumn;
    }

    public void setCantAlumn(int _cantAlumn) {
        this._cantAlumn = _cantAlumn;
    }
    
    
    public ResultSet obtenAlumnos() throws SQLException
    {
        BD.cDatos sql= new BD.cDatos();
         ResultSet alumnos= null;
        try
        {          
            sql.conectar();
            alumnos=sql.consulta("call sp_obtenAlumnos();");
            
        }catch(Exception e)
        {
            e.getMessage();
        }
        
       
        return alumnos;
    }
    
    public int numAlumnos()
    {
        int numA=0;
        ResultSet alum=null;
        try
        {
            alum=obtenAlumnos();
          while(alum.next()){
            if(!alum.getString("idAlumno").equals("10"))
            {
                numA++;
            }
          }
        }catch(Exception e)
        {
            e.getMessage();
        }
        setCantAlumn(numA);
        return getCantAlumn();
    }
}

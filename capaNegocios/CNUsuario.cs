using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using capaDatos;

namespace capaNegocios
{
    public class CNUsuario
    {
        //Encapsular variables
        private Usuarios objDato = new Usuarios();//instancia a la capa datos de empleado
        //Variables
        private String _Usuario;//Este variable tendra el valor de no ha ingresado usuario........tendra el valor del texbox enviado del fomrilario
        private String _Contraseña;

        public String Usuario
        {
            set
            {
                if (value == "Usuario")
                {
                    _Usuario = "no ha ingresado usuario";
                }
                else
                {
                    _Usuario = value;
                }
            }
            get
            {
                return _Usuario;
            }
        }
        public String Contraseña
        {
            set
            {
                if (value == "Contraseña")
                {
                    _Contraseña = "Ingrese su contraseña";
                }
                else
                {
                    _Contraseña = value;
                }
            }
            get
            {
                return _Contraseña;
            }
        }

        //CONTRUCTOR 
        public CNUsuario() { }
        //FUNCIONES O METODOS
        public SqlDataReader IniciarSesion()
        {

            SqlDataReader Loguear;
            Loguear = objDato.iniciarSesion(Usuario, Contraseña);
            return Loguear;
        }
    }
}

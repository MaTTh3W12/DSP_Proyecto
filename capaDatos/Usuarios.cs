using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace capaDatos
{
    public class Usuarios
    {
        private Conexion Conect = new Conexion();
        private SqlDataReader leer;

        public SqlDataReader iniciarSesion(string usuario, string pass)
        {
            string sql = "select *from Usuario where username '" + usuario + "' and contrasenia '" + pass + "'";
            SqlCommand comando = new SqlCommand();
            comando.Connection = Conect.AbriConexion();
            comando.CommandText = sql;

            leer = comando.ExecuteReader();
            return leer;
        }
    }
}

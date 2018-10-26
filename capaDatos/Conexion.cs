using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace capaDatos
{
    class Conexion
    {
        private SqlConnection Conect = new SqlConnection("Server = MATTHEW; DataBase = tecnologia; Integrated Security = true");
        public SqlConnection AbriConexion()
        {
            if (Conect.State == ConnectionState.Closed)

                Conect.Open();

            return Conect;
        }

        public SqlConnection CerrarConexion()
        {
            if (Conect.State == ConnectionState.Open)

                Conect.Close();

            return Conect;


        }
    }
}

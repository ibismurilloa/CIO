using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LNusuarioOCD
{
    public class Manejo_cliente
    {
        #region atributo
        private string cedula;
        private string id_direccion;
        private string nombre;

        #endregion

    
        #region propiedades
        public string Id_direccion { get => id_direccion; set => id_direccion = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        #endregion
    }

}

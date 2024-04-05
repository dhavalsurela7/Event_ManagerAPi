using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace LIBRARY
{
    /// <summary>
    /// Class for getting connectionstring via web.config
    /// </summary>
    public class Connection
    {
        public static string ConnectionString = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;
    }
}

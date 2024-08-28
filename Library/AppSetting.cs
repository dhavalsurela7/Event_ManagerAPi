
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace LIBRARY
{
    public static class AppSetting
    {
        public static string Image = ConfigurationManager.AppSettings["Image"];
    }
}

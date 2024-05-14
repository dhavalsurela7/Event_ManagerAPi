using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class MailEntity
    {
        public string Name { get; set; }
        public string OTP { get; set; }
        public string Email { get; set; }
        public string Template_Subject { get; set; }
        public string Template_Body { get; set; }


    }
}

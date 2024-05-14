using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LIBRARY;
using System.Net.Mail;
using System.Net;



namespace Library
{
    public class MailSender
    {

        public void SendEmail(string receiver, string subject, string body, bool flag, string filename)
        {

            try
            {
                MailMessage mail = new MailMessage();
                string sender = "dhavalsurela41@gmail.com";
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress(sender);
                mail.To.Add(receiver);
                mail.Subject = subject;
                mail.IsBodyHtml = flag;
                mail.Body = body;


                if (filename != null)
                {

                    mail.Attachments.Add(new Attachment(filename));

                }
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.EnableSsl = true;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new NetworkCredential(sender, "wnwigzvwzjxpcmix");


                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                InsertLog.WriteErrrorLog("EventBL=>EventOperation=>Exception" + ex.Message + ex.StackTrace);

            }


        }
   
    }
}

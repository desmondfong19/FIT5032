using SendGrid;
using SendGrid.Helpers.Mail;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

using System.Text;
using System.Net.Mail;
using System.Net;

namespace FIT5032_Week08A.Utils
{
    public class EmailSender
    {
        // Please use your API KEY here.
        private const String API_KEY = "YOUR API KEY HERE";

        public void Send(String toEmail, String subject, String contents)
        {
            //var client = new SendGridClient(API_KEY);
            //var from = new EmailAddress("noreply@localhost.com", "FIT5032 Example Email User");
            //var to = new EmailAddress(toEmail, "");
            //var plainTextContent = contents;
            //var htmlContent = "<p>" + contents + "</p>";
            //var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            //var response = client.SendEmailAsync(msg);

            var client = new SmtpClient("smtp.mailtrap.io", 2525)
            {
                Credentials = new NetworkCredential("96cc178c94c820", "86f5d3ebc38094"),
                EnableSsl = true
            };
            client.Send("from@example.com", toEmail, subject, contents);
            //Console.WriteLine("Sent");
            //Console.ReadLine();

        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            
        }
    }

}
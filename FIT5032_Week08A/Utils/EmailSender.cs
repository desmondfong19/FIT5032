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
using System.Net.Mime;

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
            //client.Send("from@example.com", toEmail, subject, contents);

            //Console.WriteLine("Sent");
            //Console.ReadLine();


            // Implementing attachment
            String filePath = "E:/Pictures/2016-04/1.txt";
            System.Net.Mail.Attachment data = new System.Net.Mail.Attachment(filePath, MediaTypeNames.Application.Octet);

            MailAddress to = new MailAddress(toEmail);
            MailAddress from = new MailAddress("systemgenerated@gmail.com");

            MailMessage message = new MailMessage(from, to);
            message.Subject = subject;
            message.Body = contents;
            message.Attachments.Add(data);

            //SmtpClient client = new SmtpClient("smtp.server.address", 2525)
            //{
            //    Credentials = new NetworkCredential("smtp_username", "smtp_password"),
            //    EnableSsl = true
            //};

            // code in brackets above needed if authentication required

            try
            {
                client.Send(message);
            }
            catch (SmtpException ex)
            {
                Console.WriteLine(ex.ToString());
            }

        }

    }

    class Program
    {
        static void Main(string[] args)
        {
            
        }
    }

}
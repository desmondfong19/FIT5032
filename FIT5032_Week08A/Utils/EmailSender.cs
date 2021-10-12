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
using System.IO;
using ByteSizeLib;

namespace FIT5032_Week08A.Utils
{
    public class EmailSender
    {
        // Please use your API KEY here.
        private const String API_KEY = "YOUR API KEY HERE";

        public void Send(String toEmail, String subject, String contents,HttpPostedFileBase postedFileBase)
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

            if (postedFileBase!= null && postedFileBase.ContentLength > 0)
            {
                // extract only the fielname
                var fileName = Path.GetFileName(postedFileBase.FileName);
                // store the file inside ~/App_Data/uploads folder
                string serverPath = System.Web.HttpContext.Current.Server.MapPath("~/Uploads/");
                var path = Path.Combine(serverPath, fileName);
                postedFileBase.SaveAs(path);
            


            // Implementing attachment
            //String filePath = "E:/Pictures/2016-04/1.txt";
            String filePath = path;
            System.Net.Mail.Attachment data = new System.Net.Mail.Attachment(filePath, MediaTypeNames.Application.Octet);

            if (data.ContentDisposition.Size < ByteSize.FromMegaBytes(1).Bytes)
            {
                MailAddress to = new MailAddress(toEmail);
                MailAddress from = new MailAddress("systemgenerated@gmail.com");

                MailMessage message = new MailMessage(from, to);
                message.Subject = subject;
                message.Body = contents;
                message.Attachments.Add(data);
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
        }

    }

}
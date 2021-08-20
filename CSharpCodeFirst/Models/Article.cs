using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CSharpCodeFirst.Models
{
    public class Article
    {
        [Key]
        public int ID { get; set; }
        public string Name { get; set; }
    }
}
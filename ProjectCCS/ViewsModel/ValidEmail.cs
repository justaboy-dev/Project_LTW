using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using ProjectCCS.Models;

namespace ProjectCCS.ViewsModel
{
    public class ValidEmail : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            ContextDB con = new ContextDB();
            var email = new EmailAddressAttribute();
            if (!email.IsValid(value))
            {
                return new ValidationResult(FormatErrorMessage(ErrorMessage = "Email is not valid !"));
            }
            else
            {
                if(value!=null)
                {
                    string Regemail = value.ToString();
                    User user = con.Users.Where(p => p.Email.Equals(Regemail)).FirstOrDefault();
                    if (user != null)
                    {
                        return new ValidationResult(FormatErrorMessage(ErrorMessage = "Email have registed, please try again with another email !"));
                    }
                }    
            }    
            return null;
         }
    }
}
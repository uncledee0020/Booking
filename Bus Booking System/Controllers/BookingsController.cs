using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using Microsoft.AspNetCore.Mvc;
using Bus_Booking_System.Models;
using System.Reflection;

namespace Bus_Booking_System.Controllers
{
    public class BookingsController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(string id)
        {
            string apiKey = ConfigurationManager.AppSettings["ApiKey"];
            if (id != apiKey)
            {
                return "value";
            }
            else
                return "unauthorized";

                
        }

        // POST api/<controller>
        [System.Web.Http.HttpPost]
        public HttpResponseMessage PostBooking([FromBody] PostModel model)
        {

            if (model!=null){
                string apiKey = ConfigurationManager.AppSettings["ApiKey"];
                Helper.WritetoFile(model.ApiKey+"model apikey");
                Helper.WritetoFile(apiKey+"apikey");
                // Check if the API key in the request matches the one in the configuration.
                // You should implement a more secure authentication method.
                if (model.ApiKey != apiKey)
                {
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, "Incorrect ApiKey");
                }
                else
                {
                    string msg = Helper.InsertPostData(model);
                    // Create a connection to your SQL database.
                    if (msg.Equals("true"))
                        return Request.CreateResponse(HttpStatusCode.OK, "Record updated successfully.");
                    else
                        return Request.CreateResponse(HttpStatusCode.ExpectationFailed, msg);

                }

            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.PartialContent, "The data can not be empty");
            }

        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}
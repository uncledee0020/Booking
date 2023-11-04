using Bus_Booking_System.Controllers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Net.Configuration;
using System.IO;

namespace Bus_Booking_System.Models
{
    public class Helper
    {
       static string connectionString = ConfigurationManager.ConnectionStrings["Booking"].ConnectionString;

        public static string InsertPostData(PostModel model)
        {
            string rtn = "";
          
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Perform the data insertion into the database.
                using (SqlCommand cmd = new SqlCommand("INSERT INTO BooKingDetails (Email, PhoneNumber, Name, Amount, Route, BookingDateTime) " +
                    "VALUES (@Email, @PhoneNumber, @Name, @Amount, @Route, @BookingDateTime)", connection))
                {
                   
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = model.Email;
                    cmd.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar).Value = model.PhoneNumber;
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = model.Name;
                    cmd.Parameters.Add("@Amount", SqlDbType.NVarChar).Value = model.Amount;
                    cmd.Parameters.Add("@Route", SqlDbType.NVarChar).Value = model.Route;
                    cmd.Parameters.Add("@BookingDateTime", SqlDbType.DateTime).Value = DateTime.Parse(model.BookingDateTime);

                    try
                    {
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                            rtn= "true";// Return true if at least one row was inserted.
                    }
                    catch (SqlException ex)
                    {
                        // Handle the SQL exception (e.g., log the error or throw an exception).
                        //Console.WriteLine("SQL Error: " + ex.Message);
                        rtn= ex.Message;
                    }
                    connection.Close();
                }
            }
            return rtn;
        }
    
        public static void WritetoFile(string errorMessage)
        {
            try
            {
                string filePath = @"C:\errors.txt"; // Specify the full path to the file on drive C.

                // Check if the file exists; if not, create it.
                if (!File.Exists(filePath))
                {
                    using (FileStream fs = File.Create(filePath))
                    {
                        // Create the file.
                    }
                }

                // Append the error message to the file.
                using (StreamWriter sw = File.AppendText(filePath))
                {
                    sw.WriteLine(DateTime.Now.ToString() + ": " + errorMessage);
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that may occur while writing to the file.
                Console.WriteLine("Error writing to the file: " + ex.Message);
            }
        }
       
    }
}
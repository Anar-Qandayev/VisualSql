using System;
using System.Data.SqlClient;

namespace AdoNet
{
    class Program
    {
        private static string connectionString = @"Server=DESKTOP-R60C9I5\SQLEXPRESS;Database=Cinema;Trusted_Connection=True; ";
        static void Main(string[] args)
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;
            Console.InputEncoding = System.Text.Encoding.UTF8;
            //CreateStudent("Elvin","Mirzeyev");
            // GetCustomersById(10);
            DeleteCustomers(3);
        }
        static void GetCustomersById(int id)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string command = $"select Name from Customers where Id={id}";
                using (SqlCommand comm = new SqlCommand(command, conn))
                {
                    //string result = comm.ExecuteScalar().ToString();
                    // Console.WriteLine(result);
                }
            }
        }
        static void CreateCustomers(string Name,string Surname)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string command = $"INSERT INTO Customers values(N'{Name}',N'{Surname}')";
               
                using (SqlCommand comm = new SqlCommand(command, conn))
                {
                    //string result = comm.ExecuteScalar().ToString();
                    //Console.WriteLine(comm.ExecuteNonQuery());
                    if (comm.ExecuteNonQuery() > 0)
                    {
                        Console.WriteLine("Customer CREATED");
                    }
                    else
                    {
                        Console.WriteLine("Somethin went wrong");
                    }
                }
            }
        }
        static void DeleteCustomers(int id)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string command = $"DELETE  Customers where Id={id}";
                using (SqlCommand comm = new SqlCommand(command, conn))
                {
                        try
                        {
                            if (comm.ExecuteNonQuery() > 0)
                            {
                                Console.WriteLine("Customer deleted");
                            }
                            else
                            {
                                Console.WriteLine("Somethin went wrong");
                            }

                        }
                        catch (NullReferenceException)
                        {

                            Console.WriteLine("Customers not found");
                        }
                    

                }
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task_Manager_2
{
    public partial class Main : System.Web.UI.Page
    {
        const string connectionString = "Data Source=localhost;Initial Catalog=task-manager;Integrated Security=True;Encrypt=False;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterAsyncTask(new PageAsyncTask(FetchFromDB));
        }

        public async void AddTask(object sender, EventArgs e)
        {
            string task = this.TaskTB.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                string query = "INSERT INTO tasks (task) VALUES (@task)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@task", task);
                    await command.ExecuteNonQueryAsync();
                }
                connection.Close();
            }

            await FetchFromDB();
        }

        // Database functions
        private async Task FetchFromDB()
        {
            await FetchTasksFromDB();
        }

        private async Task FetchTasksFromDB()
        {
            List<string> tasks = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT task FROM tasks";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    await connection.OpenAsync();

                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            // Use repeater to display data
                            string task = reader["task"].ToString();
                            tasks.Add(task);
                        }
                    }
                }
            }

            this.TasksRepeater.DataSource = tasks;
            this.TasksRepeater.DataBind();
        }
    }
}
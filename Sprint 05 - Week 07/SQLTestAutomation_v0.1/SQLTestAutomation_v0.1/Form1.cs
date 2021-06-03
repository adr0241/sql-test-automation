using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SQLTestAutomation_v0._1
{
    public partial class SQLTestApp : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string connectionString = @"Server=.; Database=NORTHWND; Integrated Security=true; MultipleActiveResultSets=True";
        string studentAnswer;
        string modelAnswer;
        string tSQLtSetup;
        string testScript;

        public SQLTestApp()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Check_SQLServer();
            tSQLt_Setup();
            ModelAnswer_Setup();
        }

        private void Check_SQLServer()
        {
            try
            {
                connection = new SqlConnection(connectionString);
                connection.Open();
                SQLServer_Status.Text = "SQL Server: Connected";
            }
            catch (Exception w)
            {
                SQLServer_Status.Text = w.Message;
            }


        }

        private void tSQLt_Setup()
        {
            try
            {
                tSQLtSetup = File.ReadAllText("scripts/Install_tSQLt.sql");

                IEnumerable<string> commandStrings = Regex.Split(tSQLtSetup, @"^\s*GO\s*$", RegexOptions.Multiline | RegexOptions.IgnoreCase);
                using (connection = new SqlConnection(connectionString))
                using (command = new SqlCommand(tSQLtSetup, connection))
                {
                    connection.Open();
                    foreach (string commandString in commandStrings)
                    {
                        if (!string.IsNullOrWhiteSpace(commandString.Trim()))
                        {
                            using (var command = new SqlCommand(commandString, connection))
                            {
                                object result = command.ExecuteNonQuery();
                                tSQLt_Status.Text = "tSQLt: Ready";

                            }
                        }
                    }
                    connection.Close();
                }
            }
            catch (Exception w)
            {
                tSQLt_Status.Text = w.Message;
            }
        }

        private void ModelAnswer_Setup()
        {
            try
            {
                modelAnswer = File.ReadAllText("scripts/PracticalTest_ModelAnswerQueries.sql");

                IEnumerable<string> commandStrings = Regex.Split(modelAnswer, @"^\s*GO\s*$", RegexOptions.Multiline | RegexOptions.IgnoreCase);
                using (connection = new SqlConnection(connectionString))
                using (command = new SqlCommand(modelAnswer, connection))
                {
                    connection.Open();
                    foreach (string commandString in commandStrings)
                    {
                        if (!string.IsNullOrWhiteSpace(commandString.Trim()))
                        {
                            using (var command = new SqlCommand(commandString, connection))
                            {
                                object result = command.ExecuteNonQuery();
                                ModelAnswer_Status.Text = "Model Answer: Ready";

                            }
                        }
                    }
                    connection.Close();
                }
            }
            catch (Exception w)
            {
                ModelAnswer_Status.Text = w.Message;
            }
        }

        private void Browse_Button_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openSQLScript = new OpenFileDialog();
                openSQLScript.Filter = "SQL Script|*.sql";
                if (openSQLScript.ShowDialog() == DialogResult.OK)
                {
                    FilePath_TextBox.Text = openSQLScript.FileName;
                    studentAnswer = File.ReadAllText(openSQLScript.FileName);
                    StudentAnswer_Status.Text = "Student Answer: Script File Selected";
                }
            }
            catch (Exception w)
            {
                Output_TextBox.Text = w.Message;
            }
            
        }

        private void Upload_Button_Click(object sender, EventArgs e)
        {
            try
            {
                IEnumerable<string> commandStrings = Regex.Split(studentAnswer, @"^\s*GO\s*$", RegexOptions.Multiline | RegexOptions.IgnoreCase);

                using (SqlConnection cn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(studentAnswer, cn))
                {
                    cn.Open();
                    foreach (string commandString in commandStrings)
                    {
                        if (!string.IsNullOrWhiteSpace(commandString.Trim()))
                        {
                            using (var command = new SqlCommand(commandString, cn))
                            {
                                object result = command.ExecuteNonQuery();
                                StudentAnswer_Status.Text = "Student Answer: Uploaded";

                            }
                        }
                    }
                    cn.Close();
                }
            }
            catch (Exception w)
            {
                Output_TextBox.Text = w.Message;
            }
            
        }

        private void MarkTest_Button_Click(object sender, EventArgs e)
        {
            try
            {
                testScript = File.ReadAllText("scripts/PracticalTest_tSQLt_TestingScript.sql");

                IEnumerable<string> commandStrings = Regex.Split(testScript, @"^\s*GO\s*$", RegexOptions.Multiline | RegexOptions.IgnoreCase);

                using (connection = new SqlConnection(connectionString))
                using (command = new SqlCommand(testScript, connection))
                {
                    connection.Open();
                    foreach (string commandString in commandStrings)
                    {
                        if (!string.IsNullOrWhiteSpace(commandString.Trim()))
                        {
                            using (var command = new SqlCommand(commandString, connection))
                            {
                                object result = command.ExecuteNonQuery();
                                Output_TextBox.Text = result.ToString();
                                StudentAnswer_Status.Text = "Student Answer: Marked!";
                            }
                        }
                    }
                    connection.Close();
                }
            }
            catch (Exception w)
            {
                Output_TextBox.Text = w.Message;
                StudentAnswer_Status.Text = "Student Answer: Marked!";
            }
        }

        private void Output_TextBox_TextChanged(object sender, EventArgs e)
        {
            Output_TextBox.ScrollBars = ScrollBars.Vertical;
        }

    }
}

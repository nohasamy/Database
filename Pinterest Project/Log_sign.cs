using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace Pinterest_Project
{
    public partial class Log_sign : Form
    {
        string ordb = "Data source=orcl;User Id=hr; Password=hr;";
        OracleConnection conn;

        public Log_sign()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = @"select user_password
                                 from users
                                 where user_name = :uname";
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("un", textBox1.Text);
            OracleDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                if(dr[0].ToString() == textBox2.Text.ToString())
                {
                    MessageBox.Show("Welcome " + textBox1.Text + ".");
                    conn.Dispose();
                    Profile p = new Profile(textBox1.Text );
                    p.Show();
                    this.Hide();
                }
                else
                    MessageBox.Show("Invaild password!");
                
            }
            dr.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int newID;
            char gender=' ';
            if (radioButton1.Checked)
                gender = 'm';
            else if (radioButton2.Checked)
                gender = 'f';
            OracleCommand c = new OracleCommand();
            c.Connection = conn;
            c.CommandText = "GETMAXID";
            c.CommandType = CommandType.StoredProcedure;
            c.Parameters.Add("id", OracleDbType.Int32, ParameterDirection.Output);
            c.ExecuteNonQuery();
            try
            {
                newID = Convert.ToInt32(c.Parameters["id"].Value.ToString()) + 1;

            }
            catch
            {
                newID = 1;
            }
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "INSERTUSER";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("newid", newID);
            cmd.Parameters.Add("fn", textBox3.Text);
            cmd.Parameters.Add("ln", textBox4.Text);
            cmd.Parameters.Add("un", textBox5.Text);
            cmd.Parameters.Add("pw", textBox6.Text);
            cmd.Parameters.Add("mail", textBox7.Text);
            cmd.Parameters.Add("addr", textBox8.Text);
            cmd.Parameters.Add("c", textBox9.Text);
            cmd.Parameters.Add("g", gender);
            cmd.ExecuteNonQuery();
            try
            {
                MessageBox.Show("Welcome " + textBox3.Text + " ,Your id is " + newID +".");
                conn.Dispose();
                Profile p = new Profile(textBox5.Text);
                p.Show();
                this.Hide();
            }
            catch
            { 
                MessageBox.Show("Welcome " + textBox3.Text + " ,Your id is " + newID + ".");
                conn.Dispose();
                Profile p = new Profile(textBox5.Text);
                p.Show();
                this.Hide();
            }
        }

        private void Log_sign_Load(object sender, EventArgs e)
        {
            conn = new OracleConnection(ordb);
            conn.Open();

        }

        private void Log_sign_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Dispose();
        }
    }
}

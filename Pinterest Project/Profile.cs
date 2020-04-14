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
    public partial class Profile : Form
    {
        string ordb = "Data source=orcl;User Id=hr; Password=hr;";
        OracleConnection conn;
        string user_name;
        int user_id;
        public Profile()
        {
            InitializeComponent();
        }
        public Profile(string username)
        {
            InitializeComponent();
            conn = new OracleConnection(ordb);
            conn.Open();
            user_name = username;
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select user_id from users where user_name =:n";
            cmd.Parameters.Add("n", user_name);
            OracleDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                user_id = Convert.ToInt32(dr[0]);
            }
            dr.Close();
            label1.Text = "Welcome " + user_name +".";
            label2.Text = "ID: " + user_id + ".";
            
        }
        private void label1_Click(object sender, EventArgs e)
        {
           
        }

        private void Profile_Load(object sender, EventArgs e)
        {

        }

        private void Profile_FormClosing(object sender, FormClosingEventArgs e)
        {
            conn.Dispose();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            dataGridView1.Rows.Clear();
            string Cmdstr;
            OracleDataAdapter adp = new OracleDataAdapter(ordb , conn);
            if (radioButton1.Checked)
                Cmdstr = " select * from followuser , users where user2_id = user_id and user_id = :id";
        }
    }
}


namespace SQLTestAutomation_v0._1
{
    partial class SQLTestApp
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SQLTestApp));
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.SQLServer_Status = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.StudentAnswer_Status = new System.Windows.Forms.Label();
            this.ModelAnswer_Status = new System.Windows.Forms.Label();
            this.tSQLt_Status = new System.Windows.Forms.Label();
            this.FilePath_TextBox = new System.Windows.Forms.TextBox();
            this.Browse_Button = new System.Windows.Forms.Button();
            this.MarkTest_Button = new System.Windows.Forms.Button();
            this.Output_TextBox = new System.Windows.Forms.TextBox();
            this.Upload_Button = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(166, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(311, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "SQL Server Test Marker";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(168, 47);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(248, 28);
            this.label2.TabIndex = 1;
            this.label2.Text = "BCDE103 SQL Practical Test";
            // 
            // SQLServer_Status
            // 
            this.SQLServer_Status.AutoSize = true;
            this.SQLServer_Status.Font = new System.Drawing.Font("Segoe UI", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SQLServer_Status.Location = new System.Drawing.Point(12, 11);
            this.SQLServer_Status.Name = "SQLServer_Status";
            this.SQLServer_Status.Size = new System.Drawing.Size(176, 19);
            this.SQLServer_Status.TabIndex = 2;
            this.SQLServer_Status.Text = "SQL Server: Not Connected";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.StudentAnswer_Status);
            this.panel1.Controls.Add(this.ModelAnswer_Status);
            this.panel1.Controls.Add(this.tSQLt_Status);
            this.panel1.Controls.Add(this.SQLServer_Status);
            this.panel1.Location = new System.Drawing.Point(10, 715);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1076, 71);
            this.panel1.TabIndex = 3;
            // 
            // StudentAnswer_Status
            // 
            this.StudentAnswer_Status.AutoSize = true;
            this.StudentAnswer_Status.Font = new System.Drawing.Font("Segoe UI", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.StudentAnswer_Status.Location = new System.Drawing.Point(509, 40);
            this.StudentAnswer_Status.Name = "StudentAnswer_Status";
            this.StudentAnswer_Status.Size = new System.Drawing.Size(228, 19);
            this.StudentAnswer_Status.TabIndex = 6;
            this.StudentAnswer_Status.Text = "Student Answer: Waiting for Upload";
            // 
            // ModelAnswer_Status
            // 
            this.ModelAnswer_Status.AutoSize = true;
            this.ModelAnswer_Status.Font = new System.Drawing.Font("Segoe UI", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ModelAnswer_Status.Location = new System.Drawing.Point(509, 11);
            this.ModelAnswer_Status.Name = "ModelAnswer_Status";
            this.ModelAnswer_Status.Size = new System.Drawing.Size(168, 19);
            this.ModelAnswer_Status.TabIndex = 5;
            this.ModelAnswer_Status.Text = "Model Answer: Not Ready";
            // 
            // tSQLt_Status
            // 
            this.tSQLt_Status.AutoSize = true;
            this.tSQLt_Status.Font = new System.Drawing.Font("Segoe UI", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tSQLt_Status.Location = new System.Drawing.Point(12, 40);
            this.tSQLt_Status.Name = "tSQLt_Status";
            this.tSQLt_Status.Size = new System.Drawing.Size(115, 19);
            this.tSQLt_Status.TabIndex = 4;
            this.tSQLt_Status.Text = "tSQLt: Not Ready";
            // 
            // FilePath_TextBox
            // 
            this.FilePath_TextBox.Font = new System.Drawing.Font("Segoe UI", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FilePath_TextBox.Location = new System.Drawing.Point(10, 90);
            this.FilePath_TextBox.Name = "FilePath_TextBox";
            this.FilePath_TextBox.Size = new System.Drawing.Size(449, 43);
            this.FilePath_TextBox.TabIndex = 5;
            // 
            // Browse_Button
            // 
            this.Browse_Button.Location = new System.Drawing.Point(465, 90);
            this.Browse_Button.Name = "Browse_Button";
            this.Browse_Button.Size = new System.Drawing.Size(207, 43);
            this.Browse_Button.TabIndex = 6;
            this.Browse_Button.Text = "1. Browse";
            this.Browse_Button.UseVisualStyleBackColor = true;
            this.Browse_Button.Click += new System.EventHandler(this.Browse_Button_Click);
            // 
            // MarkTest_Button
            // 
            this.MarkTest_Button.Location = new System.Drawing.Point(891, 90);
            this.MarkTest_Button.Name = "MarkTest_Button";
            this.MarkTest_Button.Size = new System.Drawing.Size(195, 43);
            this.MarkTest_Button.TabIndex = 7;
            this.MarkTest_Button.Text = "3. Mark Test";
            this.MarkTest_Button.UseVisualStyleBackColor = true;
            this.MarkTest_Button.Click += new System.EventHandler(this.MarkTest_Button_Click);
            // 
            // Output_TextBox
            // 
            this.Output_TextBox.Font = new System.Drawing.Font("Consolas", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Output_TextBox.Location = new System.Drawing.Point(10, 139);
            this.Output_TextBox.Multiline = true;
            this.Output_TextBox.Name = "Output_TextBox";
            this.Output_TextBox.Size = new System.Drawing.Size(1076, 570);
            this.Output_TextBox.TabIndex = 8;
            this.Output_TextBox.TextChanged += new System.EventHandler(this.Output_TextBox_TextChanged);
            // 
            // Upload_Button
            // 
            this.Upload_Button.Location = new System.Drawing.Point(679, 90);
            this.Upload_Button.Name = "Upload_Button";
            this.Upload_Button.Size = new System.Drawing.Size(206, 43);
            this.Upload_Button.TabIndex = 9;
            this.Upload_Button.Text = "2. Upload";
            this.Upload_Button.UseVisualStyleBackColor = true;
            this.Upload_Button.Click += new System.EventHandler(this.Upload_Button_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.InitialImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.InitialImage")));
            this.pictureBox1.Location = new System.Drawing.Point(12, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(125, 63);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 10;
            this.pictureBox1.TabStop = false;
            // 
            // SQLTestApp
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 28F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 788);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.Upload_Button);
            this.Controls.Add(this.Output_TextBox);
            this.Controls.Add(this.MarkTest_Button);
            this.Controls.Add(this.Browse_Button);
            this.Controls.Add(this.FilePath_TextBox);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Cursor = System.Windows.Forms.Cursors.Default;
            this.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "SQLTestApp";
            this.Text = "SQL Test Automation v0.1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label SQLServer_Status;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label StudentAnswer_Status;
        private System.Windows.Forms.Label ModelAnswer_Status;
        private System.Windows.Forms.Label tSQLt_Status;
        private System.Windows.Forms.TextBox FilePath_TextBox;
        private System.Windows.Forms.Button Browse_Button;
        private System.Windows.Forms.Button MarkTest_Button;
        private System.Windows.Forms.TextBox Output_TextBox;
        private System.Windows.Forms.Button Upload_Button;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}


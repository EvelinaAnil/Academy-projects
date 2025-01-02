namespace WindowsFormsExchange
{
    partial class MainForm
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lblCurrency = new System.Windows.Forms.Label();
            this.lblResult = new System.Windows.Forms.Label();
            this.cbCurrencies = new System.Windows.Forms.ComboBox();
            this.tbSum = new System.Windows.Forms.TextBox();
            this.btnConvert = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Валюти: ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(18, 71);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Сума: ";
            // 
            // lblCurrency
            // 
            this.lblCurrency.AutoSize = true;
            this.lblCurrency.Location = new System.Drawing.Point(194, 71);
            this.lblCurrency.Name = "lblCurrency";
            this.lblCurrency.Size = new System.Drawing.Size(0, 13);
            this.lblCurrency.TabIndex = 2;
            // 
            // lblResult
            // 
            this.lblResult.AutoSize = true;
            this.lblResult.Location = new System.Drawing.Point(248, 125);
            this.lblResult.Name = "lblResult";
            this.lblResult.Size = new System.Drawing.Size(0, 13);
            this.lblResult.TabIndex = 3;
            // 
            // cbCurrencies
            // 
            this.cbCurrencies.FormattingEnabled = true;
            this.cbCurrencies.Location = new System.Drawing.Point(77, 19);
            this.cbCurrencies.Name = "cbCurrencies";
            this.cbCurrencies.Size = new System.Drawing.Size(344, 21);
            this.cbCurrencies.Sorted = true;
            this.cbCurrencies.TabIndex = 4;
            this.cbCurrencies.SelectedIndexChanged += new System.EventHandler(this.cbCurrencies_SelectedIndexChanged);
            // 
            // tbSum
            // 
            this.tbSum.Location = new System.Drawing.Point(77, 68);
            this.tbSum.Name = "tbSum";
            this.tbSum.Size = new System.Drawing.Size(100, 20);
            this.tbSum.TabIndex = 5;
            this.tbSum.TextChanged += new System.EventHandler(this.tbSum_TextChanged);
            // 
            // btnConvert
            // 
            this.btnConvert.Enabled = false;
            this.btnConvert.Location = new System.Drawing.Point(481, 40);
            this.btnConvert.Name = "btnConvert";
            this.btnConvert.Size = new System.Drawing.Size(82, 44);
            this.btnConvert.TabIndex = 6;
            this.btnConvert.Text = "Конверт";
            this.btnConvert.UseVisualStyleBackColor = true;
            this.btnConvert.Click += new System.EventHandler(this.btnConvert_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(584, 156);
            this.Controls.Add(this.btnConvert);
            this.Controls.Add(this.tbSum);
            this.Controls.Add(this.cbCurrencies);
            this.Controls.Add(this.lblResult);
            this.Controls.Add(this.lblCurrency);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Обмін валют";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblCurrency;
        private System.Windows.Forms.Label lblResult;
        private System.Windows.Forms.ComboBox cbCurrencies;
        private System.Windows.Forms.TextBox tbSum;
        private System.Windows.Forms.Button btnConvert;
    }
}


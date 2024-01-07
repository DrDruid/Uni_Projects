namespace MathQuiz
{
    partial class CalculatorForm
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
            this.calcBox = new System.Windows.Forms.RichTextBox();
            this.subButton = new System.Windows.Forms.Button();
            this.divButton = new System.Windows.Forms.Button();
            this.multButton = new System.Windows.Forms.Button();
            this.delButton = new System.Windows.Forms.Button();
            this.acButton = new System.Windows.Forms.Button();
            this.enterButton = new System.Windows.Forms.Button();
            this.addButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // calcBox
            // 
            this.calcBox.DetectUrls = false;
            this.calcBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.calcBox.Location = new System.Drawing.Point(12, 12);
            this.calcBox.Multiline = false;
            this.calcBox.Name = "calcBox";
            this.calcBox.ReadOnly = true;
            this.calcBox.Size = new System.Drawing.Size(178, 40);
            this.calcBox.TabIndex = 1;
            this.calcBox.Text = "";
            // 
            // subButton
            // 
            this.subButton.Location = new System.Drawing.Point(150, 58);
            this.subButton.Name = "subButton";
            this.subButton.Size = new System.Drawing.Size(40, 40);
            this.subButton.TabIndex = 7;
            this.subButton.Text = "-";
            this.subButton.UseVisualStyleBackColor = true;
            // 
            // divButton
            // 
            this.divButton.Location = new System.Drawing.Point(58, 58);
            this.divButton.Name = "divButton";
            this.divButton.Size = new System.Drawing.Size(40, 40);
            this.divButton.TabIndex = 9;
            this.divButton.Text = ":";
            this.divButton.UseVisualStyleBackColor = true;
            // 
            // multButton
            // 
            this.multButton.Location = new System.Drawing.Point(104, 58);
            this.multButton.Name = "multButton";
            this.multButton.Size = new System.Drawing.Size(40, 40);
            this.multButton.TabIndex = 11;
            this.multButton.Text = "x";
            this.multButton.UseVisualStyleBackColor = true;
            // 
            // delButton
            // 
            this.delButton.Location = new System.Drawing.Point(104, 242);
            this.delButton.Name = "delButton";
            this.delButton.Size = new System.Drawing.Size(40, 40);
            this.delButton.TabIndex = 17;
            this.delButton.Text = "Del";
            this.delButton.UseVisualStyleBackColor = true;
            // 
            // acButton
            // 
            this.acButton.Location = new System.Drawing.Point(12, 58);
            this.acButton.Name = "acButton";
            this.acButton.Size = new System.Drawing.Size(40, 40);
            this.acButton.TabIndex = 18;
            this.acButton.Text = "AC";
            this.acButton.UseVisualStyleBackColor = true;
            // 
            // enterButton
            // 
            this.enterButton.Location = new System.Drawing.Point(150, 196);
            this.enterButton.Name = "enterButton";
            this.enterButton.Size = new System.Drawing.Size(40, 86);
            this.enterButton.TabIndex = 21;
            this.enterButton.Text = "Enter";
            this.enterButton.UseVisualStyleBackColor = true;
            // 
            // addButton
            // 
            this.addButton.Location = new System.Drawing.Point(150, 104);
            this.addButton.Name = "addButton";
            this.addButton.Size = new System.Drawing.Size(40, 86);
            this.addButton.TabIndex = 22;
            this.addButton.Text = "+";
            this.addButton.UseVisualStyleBackColor = true;
            // 
            // CalculatorForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(202, 292);
            this.Controls.Add(this.addButton);
            this.Controls.Add(this.enterButton);
            this.Controls.Add(this.acButton);
            this.Controls.Add(this.delButton);
            this.Controls.Add(this.multButton);
            this.Controls.Add(this.divButton);
            this.Controls.Add(this.subButton);
            this.Controls.Add(this.calcBox);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(2);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "CalculatorForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "Calculator";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.CalculatorForm_FormClosing);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.RichTextBox calcBox;
        private System.Windows.Forms.Button subButton;
        private System.Windows.Forms.Button divButton;
        private System.Windows.Forms.Button multButton;
        private System.Windows.Forms.Button delButton;
        private System.Windows.Forms.Button acButton;
        private System.Windows.Forms.Button enterButton;
        private System.Windows.Forms.Button addButton;
    }
}
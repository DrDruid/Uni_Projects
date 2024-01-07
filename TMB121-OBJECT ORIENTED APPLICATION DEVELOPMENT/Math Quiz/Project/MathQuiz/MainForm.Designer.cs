namespace MathQuiz
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
            this.components = new System.ComponentModel.Container();
            this.startButton = new System.Windows.Forms.Button();
            this.mainTimer = new System.Windows.Forms.Timer(this.components);
            this.timeLabel = new System.Windows.Forms.Label();
            this.calculatorButton = new System.Windows.Forms.Button();
            this.mainMenuStrip = new System.Windows.Forms.MenuStrip();
            this.gameMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.startMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.stopMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.booToolStripMenuItem = new System.Windows.Forms.ToolStripSeparator();
            this.exitMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.quizHelpMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.helpMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.booToolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.calculatorMenu = new System.Windows.Forms.ToolStripMenuItem();
            this.mainMenuStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // startButton
            // 
            this.startButton.Location = new System.Drawing.Point(210, 68);
            this.startButton.Margin = new System.Windows.Forms.Padding(2);
            this.startButton.Name = "startButton";
            this.startButton.Size = new System.Drawing.Size(75, 50);
            this.startButton.TabIndex = 0;
            this.startButton.Text = "Start the Quiz";
            this.startButton.UseVisualStyleBackColor = true;
            this.startButton.Click += new System.EventHandler(this.startButton_Click);
            // 
            // mainTimer
            // 
            this.mainTimer.Interval = 1000;
            this.mainTimer.Tick += new System.EventHandler(this.mainTimer_Tick);
            // 
            // timeLabel
            // 
            this.timeLabel.Location = new System.Drawing.Point(211, 40);
            this.timeLabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.timeLabel.Name = "timeLabel";
            this.timeLabel.Size = new System.Drawing.Size(73, 17);
            this.timeLabel.TabIndex = 1;
            this.timeLabel.Text = "Time: 00:00";
            this.timeLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // calculatorButton
            // 
            this.calculatorButton.AutoSize = true;
            this.calculatorButton.Enabled = false;
            this.calculatorButton.Location = new System.Drawing.Point(210, 125);
            this.calculatorButton.Margin = new System.Windows.Forms.Padding(2);
            this.calculatorButton.Name = "calculatorButton";
            this.calculatorButton.Size = new System.Drawing.Size(75, 23);
            this.calculatorButton.TabIndex = 22;
            this.calculatorButton.Text = "Calculator";
            this.calculatorButton.UseVisualStyleBackColor = true;
            this.calculatorButton.Click += new System.EventHandler(this.calculatorButton_Click);
            // 
            // mainMenuStrip
            // 
            this.mainMenuStrip.BackColor = System.Drawing.Color.White;
            this.mainMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gameMenu,
            this.quizHelpMenu});
            this.mainMenuStrip.Location = new System.Drawing.Point(0, 0);
            this.mainMenuStrip.Name = "mainMenuStrip";
            this.mainMenuStrip.Size = new System.Drawing.Size(296, 24);
            this.mainMenuStrip.TabIndex = 23;
            this.mainMenuStrip.Text = "menuStrip1";
            // 
            // gameMenu
            // 
            this.gameMenu.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.startMenu,
            this.stopMenu,
            this.booToolStripMenuItem,
            this.exitMenu});
            this.gameMenu.Name = "gameMenu";
            this.gameMenu.Size = new System.Drawing.Size(50, 20);
            this.gameMenu.Text = "Game";
            // 
            // startMenu
            // 
            this.startMenu.Name = "startMenu";
            this.startMenu.ShortcutKeys = System.Windows.Forms.Keys.F2;
            this.startMenu.Size = new System.Drawing.Size(180, 22);
            this.startMenu.Text = "Start the Quiz";
            this.startMenu.Click += new System.EventHandler(this.startMenu_Click);
            // 
            // stopMenu
            // 
            this.stopMenu.Name = "stopMenu";
            this.stopMenu.Size = new System.Drawing.Size(180, 22);
            this.stopMenu.Text = "Stop the Quiz";
            this.stopMenu.Visible = false;
            this.stopMenu.Click += new System.EventHandler(this.stopMenu_Click);
            // 
            // booToolStripMenuItem
            // 
            this.booToolStripMenuItem.Name = "booToolStripMenuItem";
            this.booToolStripMenuItem.Size = new System.Drawing.Size(177, 6);
            // 
            // exitMenu
            // 
            this.exitMenu.Name = "exitMenu";
            this.exitMenu.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Alt | System.Windows.Forms.Keys.F4)));
            this.exitMenu.Size = new System.Drawing.Size(180, 22);
            this.exitMenu.Text = "Exit";
            this.exitMenu.Click += new System.EventHandler(this.exitMenu_Click);
            // 
            // quizHelpMenu
            // 
            this.quizHelpMenu.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.helpMenu,
            this.booToolStripMenuItem1,
            this.calculatorMenu});
            this.quizHelpMenu.Name = "quizHelpMenu";
            this.quizHelpMenu.Size = new System.Drawing.Size(71, 20);
            this.quizHelpMenu.Text = "Quiz Help";
            this.quizHelpMenu.Visible = false;
            // 
            // helpMenu
            // 
            this.helpMenu.Name = "helpMenu";
            this.helpMenu.Size = new System.Drawing.Size(180, 22);
            this.helpMenu.Text = "Help";
            this.helpMenu.Click += new System.EventHandler(this.helpMenu_Click);
            // 
            // booToolStripMenuItem1
            // 
            this.booToolStripMenuItem1.Name = "booToolStripMenuItem1";
            this.booToolStripMenuItem1.Size = new System.Drawing.Size(177, 6);
            // 
            // calculatorMenu
            // 
            this.calculatorMenu.Name = "calculatorMenu";
            this.calculatorMenu.Size = new System.Drawing.Size(180, 22);
            this.calculatorMenu.Text = "Calculator";
            this.calculatorMenu.Click += new System.EventHandler(this.calculatorMenu_Click);
            // 
            // MainForm
            // 
            this.AcceptButton = this.startButton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(296, 158);
            this.Controls.Add(this.calculatorButton);
            this.Controls.Add(this.timeLabel);
            this.Controls.Add(this.startButton);
            this.Controls.Add(this.mainMenuStrip);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.mainMenuStrip;
            this.Margin = new System.Windows.Forms.Padding(2);
            this.MaximizeBox = false;
            this.Name = "MainForm";
            this.Text = "MathQuiz";
            this.mainMenuStrip.ResumeLayout(false);
            this.mainMenuStrip.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button startButton;
        private System.Windows.Forms.Timer mainTimer;
        private System.Windows.Forms.Label timeLabel;
        private System.Windows.Forms.Button calculatorButton;
        private System.Windows.Forms.MenuStrip mainMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem gameMenu;
        private System.Windows.Forms.ToolStripMenuItem startMenu;
        private System.Windows.Forms.ToolStripMenuItem stopMenu;
        private System.Windows.Forms.ToolStripSeparator booToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitMenu;
        private System.Windows.Forms.ToolStripMenuItem quizHelpMenu;
        private System.Windows.Forms.ToolStripMenuItem helpMenu;
        private System.Windows.Forms.ToolStripSeparator booToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem calculatorMenu;
    }
}


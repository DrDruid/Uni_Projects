using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MathQuiz
{
    public partial class MainForm : Form
    {
        class Statistics
        {
            public int NumErrors { get; set; } = 0;
            public int NumCorrect { get; set; } = 0;
            public bool UsedCalculator { get; set; } = false;
            public int Score
            {
                get => NumCorrect * 100 - NumErrors * 5 - (UsedCalculator == true ? 10 : 0);
            }
            public void ResetStatistics()
            {
                NumErrors = 0;
                NumCorrect = 0;
                UsedCalculator = false;
            }
        };

        Statistics stats = new Statistics();

        bool           isGameRunning  = false;                // Whether a quiz is in progress or not
        CalculatorForm calculatorForm = new CalculatorForm(); // Calculator form
        HelpForm       helpForm       = new HelpForm();       // Help form
        Random         random         = new Random();         // The main random engine

        QuizPart[] quizList = new QuizPart[4];

        int timeRemaining = 120;

        private void startMenu_Click(object sender, EventArgs e)
        {
            StartQuiz();
        }

        private void mainTimer_Tick(object sender, EventArgs e)
        {
            timeRemaining--;
            int timeTemp = timeRemaining < 0 ? -timeRemaining : timeRemaining;
            timeLabel.Text = $"Time: " + (timeRemaining < 0 ? "-" : "0") + (timeTemp / 60) + (timeTemp % 60 < 10 ? ":0" : ":") + (timeTemp % 60);

            // Change background colour based on the remaining time
            if (timeRemaining <= 0)
            {
                timeLabel.BackColor = Color.Red;
                timeLabel.ForeColor = Color.White;
            }
            else if (timeRemaining <= 10)
            {
                timeLabel.BackColor = Color.Orange;
                timeLabel.ForeColor = Color.Black;
            }
            else if (timeRemaining <= 30)
            {
                timeLabel.BackColor = Color.Yellow;
                timeLabel.ForeColor = Color.Black;
            }
            else if (timeRemaining <= 60)
            {
                timeLabel.BackColor = Color.YellowGreen;
                timeLabel.ForeColor = Color.Black;
            }
            else
            {
                timeLabel.BackColor = Color.Green;
                timeLabel.ForeColor = Color.White;
            }
        }

        private void startButton_Click(object sender, EventArgs e)
        {
            if (!isGameRunning) StartQuiz();
            else
            {
                // Here the start quiz button acts as a submit button
                int i, wrong;
                for (i = 0, wrong = 0; i < 4; i++)
                {
                    switch(i)
                    {
                        // Check the type of mistake
                        case 0:
                            if (quizList[0].Num1 + quizList[0].Num2 != quizList[0].NumericResult.Value)
                            {
                                if (
                                    quizList[0].NumericResult.Value == quizList[0].Num1 - quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 * quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 / quizList[0].Num2)
                                    MessageBox.Show("Addition: Did you perform the right operation?");
                                else if (
                                    quizList[0].NumericResult.Value < quizList[0].Num1 + quizList[0].Num2 + 5 &&
                                    quizList[0].NumericResult.Value > quizList[0].Num1 + quizList[0].Num2 - 5)
                                    MessageBox.Show("Addition: You're close.");
                                else
                                    MessageBox.Show("Addition: There's a mistake.");
                                wrong++;
                            }
                            break;
                        case 1:
                            if (quizList[1].Num1 - quizList[1].Num2 != quizList[1].NumericResult.Value)
                            {
                                if (
                                    quizList[0].NumericResult.Value == quizList[0].Num1 + quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 * quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 / quizList[0].Num2)
                                    MessageBox.Show("Subtraction: Did you perform the right operation?");
                                else if (
                                    quizList[0].NumericResult.Value < quizList[0].Num1 - quizList[0].Num2 + 5 &&
                                    quizList[0].NumericResult.Value > quizList[0].Num1 - quizList[0].Num2 - 5)
                                    MessageBox.Show("Subtraction: You're close.");
                                else
                                    MessageBox.Show("Subtraction: There's a mistake.");
                                wrong++;
                            }
                            break;
                        case 2:
                            if (quizList[2].Num1 * quizList[2].Num2 != quizList[2].NumericResult.Value)
                            {
                                if (
                                    quizList[0].NumericResult.Value == quizList[0].Num1 + quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 - quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 / quizList[0].Num2)
                                    MessageBox.Show("Multiplication: Did you perform the right operation?");
                                else if (
                                    quizList[0].NumericResult.Value < quizList[0].Num1 * quizList[0].Num2 + 5 &&
                                    quizList[0].NumericResult.Value > quizList[0].Num1 * quizList[0].Num2 - 5)
                                    MessageBox.Show("Multiplication: You're close.");
                                else
                                    MessageBox.Show("Multiplication: There's a mistake.");
                                wrong++;
                            }
                            break;
                        case 3:
                            if (quizList[3].Num1 / quizList[3].Num2 != quizList[3].NumericResult.Value)
                            {
                                if (
                                    quizList[0].NumericResult.Value == quizList[0].Num1 + quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 - quizList[0].Num2 ||
                                    quizList[0].NumericResult.Value == quizList[0].Num1 * quizList[0].Num2)
                                    MessageBox.Show("Division: Did you perform the right operation?");
                                else if (
                                    quizList[0].NumericResult.Value < quizList[0].Num1 / quizList[0].Num2 + 5 &&
                                    quizList[0].NumericResult.Value > quizList[0].Num1 / quizList[0].Num2 - 5)
                                    MessageBox.Show("Division: You're close.");
                                else
                                    MessageBox.Show("Division: There's a mistake.");
                                wrong++;
                            }
                            break;
                    }

                    if (wrong > 0) break;
                }


                if (wrong == 0)
                {
                    // Correct answer
                    stats.NumCorrect++;
                    if (timeRemaining > 0)
                        StartNewQuiz();
                    else
                    {
                        // Show stastistics
                        mainTimer.Enabled = false;
                        for (i = 0; i < 4; i++) quizList[i].Enabled = false;

                        MessageBox.Show($"Quiz Over\nCorrect Answers: {stats.NumCorrect}\nWrong Answers: {stats.NumErrors}\nTotal Time: {120 - timeRemaining}s\nExceeded Time: " + (timeRemaining < 0 ? "Yes" : "No") + "\nUsed Calculator: " + (stats.UsedCalculator ? "Yes" : "No") + $"\nScore: {stats.Score + timeRemaining}");

                        EndQuiz();
                    }
                }
                else stats.NumErrors++;
            }
        }

        private void StartQuiz()
        {
            isGameRunning = true;
            mainTimer.Enabled = true;
            for (int i = 0; i < 4; i++) quizList[i].Enabled = true;
            startMenu.Visible = false;
            stopMenu.Visible = true;
            quizHelpMenu.Visible = true;
            startButton.Text = "Submit Answers";
            timeLabel.Text = "Time: 02:00";
            timeLabel.BackColor = Color.Green;
            timeLabel.ForeColor = Color.White;
            calculatorButton.Enabled = true;
            StartNewQuiz();
        }

        private void EndQuiz()
        {
            calculatorForm.Hide();

            isGameRunning = false;
            mainTimer.Enabled = false;
            timeRemaining = 120;
            for (int i = 0; i < 4; i++) quizList[i].Enabled = false;
            startMenu.Visible = true;
            stopMenu.Visible = false;
            quizHelpMenu.Visible = false;
            startButton.Text = "Start the Quiz";
            timeLabel.Text = "Time: 00:00";
            timeLabel.BackColor = Color.Transparent;
            timeLabel.ForeColor = Color.Black;
            calculatorButton.Enabled = false;
            stats.ResetStatistics();
        }

        private void StartNewQuiz()
        {
            for (int i = 0; i < 3; i++)
            {
                quizList[i].Num1 = random.Next(1, 50);
                do
                {
                    quizList[i].Num2 = random.Next(1, 50);
                } while (quizList[i].Num2 == 0);
                quizList[i].NumericResult.Value = 0;
            }
            quizList[3].Num2 = random.Next(1, 50);
            quizList[3].Num1 = random.Next(1, 50) * quizList[3].Num2;
            quizList[3].NumericResult.Value = 0;
        }
        
        private void exitMenu_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        
        public MainForm()
        {
            InitializeComponent();

            quizList[0] = new QuizPart("+", false); // Addition
            quizList[1] = new QuizPart("-", false); // Subtraction
            quizList[2] = new QuizPart("x", false); // Multiplication
            quizList[3] = new QuizPart(":", true);  // Division

            // Position the elements in the form
            for (int i = 0; i < 4; i++)
            {
                quizList[i].Location = new Point(ClientRectangle.X + 12, ClientRectangle.Y + mainMenuStrip.Height + 12 + i * 30);
                quizList[i].Enabled = false;
                Controls.Add(quizList[i].LabelNum1);
                Controls.Add(quizList[i].LabelNum2);
                Controls.Add(quizList[i].LabelSymbol);
                Controls.Add(quizList[i].LabelEqual);
                Controls.Add(quizList[i].NumericResult);
            }
        }

        private void calculatorButton_Click(object sender, EventArgs e)
        {
            stats.UsedCalculator = true;
            calculatorForm.Show();
        }

        private void calculatorMenu_Click(object sender, EventArgs e)
        {
            stats.UsedCalculator = true;
            calculatorForm.Show();
        }

        private void stopMenu_Click(object sender, EventArgs e)
        {
            EndQuiz();
        }

        private void helpMenu_Click(object sender, EventArgs e)
        {
            helpForm.Show();
        }
    }
}

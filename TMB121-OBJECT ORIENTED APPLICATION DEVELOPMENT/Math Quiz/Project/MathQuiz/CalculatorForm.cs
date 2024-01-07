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
    public partial class CalculatorForm : Form
    {
        class NumberButton : Button
        {
            // Variables
            int number;
            public int Number
            {
                get => number;
                set
                {
                    number = value;
                    this.Text = value.ToString();
                }
            }

            public NumberButton(int _Num)
            {
                Number = _Num;
                Size = new Size(40, 40);
            }
        }

        NumberButton[] numButtonList = new NumberButton[10];
        enum operationEnum : int { NO_OPERATION, ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION };
        int operation = (int)operationEnum.NO_OPERATION;
        int num1 = 0, num2 = 0;

        public CalculatorForm()
        {
            InitializeComponent();

            // Place number buttons
            for (int i = 0; i < 10; i++)
            {
                numButtonList[i] = new NumberButton(i);
                switch (i)
                {
                    case 0:
                        numButtonList[i].Location = new Point(12, 242);
                        numButtonList[i].Size = new Size(86, 40);
                        break;
                    default:
                        numButtonList[i].Location = new Point(12 + (i - 1) % 3 * 46, 196 - (i - 1) / 3 * 46);
                        break;

                }
                numButtonList[i].Click += (object o, EventArgs e) =>
                {
                    calcBox.Text += ((NumberButton)o).Text;
                };
                Controls.Add(numButtonList[i]);
            }

            addButton.Click += OperatorButton_Click;
            subButton.Click += OperatorButton_Click;
            multButton.Click += OperatorButton_Click;
            divButton.Click += OperatorButton_Click;

            acButton.Click += (object o, EventArgs e) =>
            {
                num1 = 0;
                num2 = 0;
                operation = 0;
                calcBox.Text = string.Empty;
            };

            enterButton.Click += (object o, EventArgs e) =>
            {
                PerformOperation();
                operation = 0;
            };

            delButton.Click += (object o, EventArgs e) =>
            {
                if (calcBox.Text.Length == 0) return;
                if (!char.IsDigit(calcBox.Text[calcBox.Text.Length - 1])) operation = (int)operationEnum.NO_OPERATION;
                calcBox.Text = calcBox.Text.Substring(0, calcBox.Text.Length - 1);
            };

        }

        // Add each operation symbol to the calcBox
        void OperatorButton_Click(object sender, EventArgs args)
        {
            if (operation != 0)
            {
                PerformOperation();
            }
            if ((Button)sender == addButton)
            {
                operation = (int)operationEnum.ADDITION;
                calcBox.Text += "+";
            }
            else if ((Button)sender == subButton)
            {
                operation = (int)operationEnum.SUBTRACTION;
                calcBox.Text += "-";
            }
            else if ((Button)sender == multButton)
            {
                operation = (int)operationEnum.MULTIPLICATION;
                calcBox.Text += "x";
            }
            else
            {
                operation = (int)operationEnum.DIVISION;
                calcBox.Text += ":";
            }
        }

        private void CalculatorForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
                Hide();
            }
        }

        void PerformOperation()
        {
            // Parse the numbers
            string[] numbers = calcBox.Text.Split(new char[] { '+', '-', 'x', ':' });
            try { num1 = int.Parse(numbers[0]); }
            catch(Exception) { num1 = 0; }
            try { num2 = int.Parse(numbers[1]); }
            catch(Exception) { num2 = operation == (int)operationEnum.MULTIPLICATION || operation == (int)operationEnum.DIVISION ? 1 : 0; }

            switch (operation)
            {
                case (int)operationEnum.ADDITION:
                    num1 = num1 + num2;
                    break;
                case (int)operationEnum.SUBTRACTION:
                    num1 = num1 - num2;
                    break;
                case (int)operationEnum.MULTIPLICATION:
                    num1 = num1 * num2;
                    break;
                case (int)operationEnum.DIVISION:
                    if (num2 == 0)
                    {
                        num1 = 0;
                        break;
                    }
                    num1 = num1 / num2;
                    break;
            }
            num2 = 0;
            calcBox.Text = num1 == 0 ? "" : num1.ToString();
        }
    }
}

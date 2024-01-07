using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MathQuiz
{
    class QuizPart
    {
        // Variables
        Point location;
        int num1, num2;

        // Properties
        public Label LabelNum1 { get; }
        public Label LabelNum2 { get; }
        public Label LabelSymbol { get; }
        public Label LabelEqual { get; }
        public NumericUpDown NumericResult { get; }

        public bool Visible
        {
            get
            {
                return
                    LabelNum1.Visible   ||
                    LabelNum2.Visible   ||
                    LabelSymbol.Visible ||
                    LabelEqual.Visible  ||
                    NumericResult.Visible;
            }
            set
            {
                LabelNum1.Visible     = value;
                LabelNum2.Visible     = value;
                LabelSymbol.Visible   = value;
                LabelEqual.Visible    = value;
                NumericResult.Visible = value;
            }
        }
        public bool Enabled
        {
            get => NumericResult.Enabled;
            set
            {
                if (!value)
                {
                    LabelNum1.Text = "";
                    LabelNum2.Text = "";
                    NumericResult.Value = 0;
                }

                NumericResult.Enabled = value;
            }
        }
        public bool IsDivision { get; }
        public Point Location
        {
            get => location;
            set
            {
                location               = value;
                LabelNum1.Location     = new Point(value.X, value.Y);
                LabelSymbol.Location   = new Point(value.X + 50, value.Y);
                LabelNum2.Location     = new Point(value.X + 70, value.Y);
                LabelEqual.Location    = new Point(value.X + 120, value.Y);
                NumericResult.Location = new Point(value.X + 140, value.Y + 2);
            }
        }
        public int Num1
        {
            get => num1;
            set
            {
                num1 = value;
                LabelNum1.Text = value.ToString();
            }
        }
        public int Num2
        {
            get => num2;
            set
            {
                num2 = value;
                LabelNum2.Text = value.ToString();
            }
        }

        public QuizPart(string _Symbol, bool _IsDivision)
        {
            LabelNum1 = new Label();
            LabelNum2 = new Label();
            LabelSymbol = new Label();
            LabelEqual = new Label();
            NumericResult = new NumericUpDown();

            LabelSymbol.Text = _Symbol;
            LabelEqual.Text = "=";

            LabelNum1.Text = "1000";
            LabelNum2.Text = "300";

            LabelNum1.Size = new Size(50, 23);
            LabelNum2.Size = new Size(50, 23);
            LabelSymbol.Size = new Size(20, 23);
            LabelEqual.Size = new Size(20, 23);
            NumericResult.Size = new Size(50, 20);

            LabelNum1.BorderStyle = BorderStyle.FixedSingle;
            LabelNum2.BorderStyle = BorderStyle.FixedSingle;

            LabelNum1.TextAlign = ContentAlignment.MiddleLeft;
            LabelNum2.TextAlign = ContentAlignment.MiddleLeft;
            LabelSymbol.TextAlign = ContentAlignment.MiddleCenter;
            LabelEqual.TextAlign = ContentAlignment.MiddleCenter;

            NumericResult.Maximum = 90000;
            NumericResult.Minimum = -90000;
        }
    }
}

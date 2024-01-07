package com.p17178.mathematicquiz;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    Button button_start,button_choice1,button_choice2,button_choice3,button_choice4,goto_btn;
    TextView view_time,view_score,display_questions,view_bottom;
    ProgressBar progressBar_timer;

    Quiz q= new Quiz();
    int secondsLeft=45;
    CountDownTimer timer=new CountDownTimer(45000,1000) {
        @Override
        public void onTick(long l) {
            secondsLeft--;
            view_time.setText(Integer.toString(secondsLeft)+"seconds");
            progressBar_timer.setProgress(45-secondsLeft);





        }

        @Override
        public void onFinish() {
            button_choice1.setEnabled(false);
            button_choice2.setEnabled(false);
            button_choice3.setEnabled(false);
            button_choice4.setEnabled(false);
            view_bottom.setText("Time is up!1"+q.getNumberCor()+"/"+(q.getTotalQ()-1));
            final Handler handler=new Handler();
            handler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    button_start.setVisibility((View.VISIBLE));
                    goto_btn.setVisibility(View.VISIBLE);
                    secondsLeft=45;
                    q =new Quiz();
                    nextQuiz();
                    timer.start();

                }
            },4000);


        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button_start=findViewById(R.id.button_start);
        button_choice1=findViewById(R.id.button_choice1);
        button_choice2=findViewById(R.id.button_choice2);
        button_choice3=findViewById(R.id.button_choice3);
        button_choice4=findViewById(R.id.button_choice4);
        goto_btn=findViewById(R.id.goto_btn);

        view_score=findViewById(R.id.view_score);
        view_time=findViewById(R.id.view_time);
        view_bottom=findViewById(R.id.view_bottom);
        display_questions=findViewById(R.id.display_questions);

        progressBar_timer=findViewById(R.id.progressBar_timer);

        view_time.setText("0 sec");
        display_questions.setText(" ");
        view_bottom.setText("Press Begin to start");
        view_score.setText("0 points");

         View.OnClickListener startButtonClick=new View.OnClickListener() {
             @Override
             public void onClick(View v) {
                 Button start_button= (Button) v;
                 start_button.setVisibility(View.INVISIBLE);
                 goto_btn.setVisibility(View.INVISIBLE);
                 nextQuiz();
                 timer.start();


             }


        };
         View.OnClickListener answerbuttonClicker=new View.OnClickListener()
         {
             @Override
             public void onClick(View v)
             {
                Button buttonClicked= (Button) v;
                int answerSelected=Integer.parseInt(buttonClicked.getText().toString());
                q.checkAnswer(answerSelected);
                view_score.setText(Integer.toString(q.getScore()));
                nextQuiz();
             }
         };
        goto_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent gotoTheoryPage=new Intent(view.getContext(),TheoryPage.class);
               startActivity(gotoTheoryPage); }
        });

        button_start.setOnClickListener(startButtonClick);
        button_choice1.setOnClickListener(answerbuttonClicker);
        button_choice2.setOnClickListener(answerbuttonClicker);
        button_choice3.setOnClickListener(answerbuttonClicker);
        button_choice4.setOnClickListener(answerbuttonClicker);



    }
    private void nextQuiz()
    {
        q.generateNewQ();
        int [] answ=q.getCurrentQ().getAnswerArray();
        button_choice1.setText(Integer.toString(answ[0]));
        button_choice2.setText(Integer.toString(answ[1]));
        button_choice3.setText(Integer.toString(answ[2]));
        button_choice4.setText(Integer.toString(answ[3]));

        display_questions.setText(q.getCurrentQ().getQuestion());
        view_bottom.setText(q.getNumberCor()+"/"+(q.getTotalQ()-1));
         button_choice1.setEnabled(true);
        button_choice2.setEnabled(true);
        button_choice3.setEnabled(true);
        button_choice4.setEnabled(true);



    }

}
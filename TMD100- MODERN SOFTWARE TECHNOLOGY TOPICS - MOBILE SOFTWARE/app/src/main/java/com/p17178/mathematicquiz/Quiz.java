package com.p17178.mathematicquiz;

import java.util.ArrayList;
import java.util.List;

public class Quiz {



    private List<Questions>questions;
    private int numberCor;
    private int numberIncor;
    private int totalQ;
    private int score;
    private Questions currentQ;

    public Quiz()
    {

      numberCor=0;
      numberIncor=0;
      totalQ=0;
      score=0;
      currentQ= new Questions(10);
      questions=new ArrayList<Questions>();

    }
    public void generateNewQ()
    {
        currentQ=new Questions(totalQ*2+4);
        totalQ++;
        questions.add(currentQ);

    }
    public boolean checkAnswer(int sumbited)
    {
        boolean isCorrect;
        if(currentQ.getAnswer()==sumbited)
        {
            numberCor++;
            isCorrect=true;
        }
        else
        {
            numberIncor++;
            isCorrect=false;
        }
        score=numberCor*10-numberIncor*15;
        return isCorrect;
    }
    public List<Questions> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Questions> questions) {
        this.questions = questions;
    }

    public int getNumberCor() {
        return numberCor;
    }

    public void setNumberCor(int numberCor) {
        this.numberCor = numberCor;
    }

    public int getNumberIncor() {
        return numberIncor;
    }

    public void setNumberIncor(int numberIncor) {
        this.numberIncor = numberIncor;
    }

    public int getTotalQ() {
        return totalQ;
    }

    public void setTotalQ(int totalQ) {
        this.totalQ = totalQ;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Questions getCurrentQ() {
        return currentQ;
    }

    public void setCurrentQ(Questions currentQ) {
        this.currentQ = currentQ;
    }
}

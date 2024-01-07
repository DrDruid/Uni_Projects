package com.p17178.mathematicquiz;

import java.util.Random;

public class Questions {
    private int firstNumber;
    private int secondNumber;
    private int answer;
    private int [] answerArray;
    private double [] doubleanswerArray;
    private double [] danswerPosition;
    private int answerPosition;
    //when multiplying double c = (double)tmp
    private int maxVariety;
    private String questionPhr;
    //  generate constructor
     public Questions(int maxVariety)
     {
         this.maxVariety=maxVariety;
         Random randomNumberGenerator= new Random();

         this.firstNumber =randomNumberGenerator.nextInt(maxVariety);
         this.secondNumber =randomNumberGenerator.nextInt(maxVariety);
         this.answer=questionproducer(this.firstNumber,this.secondNumber);




         this.answerArray= new int[]{0,1,2,3};
         this.answerArray[0]= answer + 1;
         this.answerArray[1]= answer + 10;
         this.answerArray[2]= answer -6 ;
         this.answerArray[3]= answer -3 ;

         this.answerArray=shuffleArray(this.answerArray);

         this.answerPosition= randomNumberGenerator.nextInt(4);
         answerArray[answerPosition]=answer;

     }

    private int questionproducer(int firstNumber, int secondNumber) {
        Random randomNumber= new Random();

        int answerint;
        secondNumber=this.secondNumber;
        firstNumber=this.firstNumber;

        int number=randomNumber.nextInt(5);
        if(number==1)
        {
            answerint= firstNumber+secondNumber;
            this.questionPhr=firstNumber+"+"+secondNumber + "=";
        }
        else if(number==2)
        {
            answerint=firstNumber-secondNumber;
            this.questionPhr=firstNumber+"-"+secondNumber +"=";
        }
        else if(number==3)
        {
            answerint=firstNumber*secondNumber;
            this.questionPhr=firstNumber+"*"+secondNumber +"=";
        }
        else if(firstNumber>secondNumber)
            {
                answerint=firstNumber/secondNumber;
                this.questionPhr=firstNumber+"/"+secondNumber +"=";
        }
        else
        {
            answerint=secondNumber/firstNumber;
            this.questionPhr=secondNumber+"/"+firstNumber +"=";
        }

         return answerint;
    }


    private int [] shuffleArray(int[] array)
     {
         int index,temp;
         Random randomNumberGenerato1= new Random();
         for(int i=array.length -1;i>0;i--)
         {
          index = randomNumberGenerato1.nextInt(i+1);
          temp=array[index];
          array[index]=array[i];
          array[i]=temp;
         }
         return array;
     }

    public int getFirstNumber() {
        return firstNumber;
    }

    public void setFirstNumber(int firstNumber) {
        this.firstNumber = firstNumber;
    }

    public int getSecondNumber() {
        return secondNumber;
    }

    public void setSecondNumber(int secondNumber) {
        this.secondNumber = secondNumber;
    }

    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    public int[] getAnswerArray() {
        return answerArray;
    }

    public void setAnswerArray(int[] answerArray) {
        this.answerArray = answerArray;
    }

    public double[] getDoubleanswerArray() {
        return doubleanswerArray;
    }

    public void setDoubleanswerArray(double[] doubleanswerArray) {
        this.doubleanswerArray = doubleanswerArray;
    }

    public double[] getDanswerPosition() {
        return danswerPosition;
    }

    public void setDanswerPosition(double[] danswerPosition) {
        this.danswerPosition = danswerPosition;
    }

    public int getAnswerPosition() {
        return answerPosition;
    }

    public void setAnswerPosition(int answerPosition) {
        this.answerPosition = answerPosition;
    }

    public int getMaxVariety() {
        return maxVariety;
    }

    public void setMaxVariety(int maxVariety) {
        this.maxVariety = maxVariety;
    }

    public String getQuestion() {
        return questionPhr;
    }

    public void setQuestion(String questionPhr) {
        this.questionPhr = questionPhr;
    }
}

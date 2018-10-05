public class ExamTestScenario {
	public String myString;
    
    public String getMyString(){
        return 'getMyString';
    }
    
    public String getStringMethod1(){
        return myString;
    }
    
    public String getStringMethod2(){
        if(myString == null){
            myString = 'Method2';
        }
        return myString;
    }
}
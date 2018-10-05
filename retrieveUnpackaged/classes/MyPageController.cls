public class MyPageController {
    private String message;
    public Integer count{get; set;}
    
    public MyPageController(){
        message = 'Welcome!';
        count = 0;
    }
    
    public String getMessage(){
        return message;
    }
    
    public void setMessage(string m){
        message = m;
    }
    
    public PageReference save(){
        count ++;
        return ApexPages.currentPage();
    }

}
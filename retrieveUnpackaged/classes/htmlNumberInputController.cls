public class htmlNumberInputController {
    Integer NumberValue;
    
    public Integer getNumberValue(){
        return NumberValue;
    }
    public void setNumberValue(Integer val){
        NumberValue = val;
    }
    public PageReference changeValue(){
        System.debug(numberValue);
        return ApexPages.currentPage();
    }
}
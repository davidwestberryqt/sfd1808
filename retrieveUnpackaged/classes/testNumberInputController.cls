public with sharing class testNumberInputController {

    public PageReference logNumber() {
        System.debug(numberValue);
        return null;
    }


    public Integer numberValue { get; set; }
    
    public testNumberInputController(){
        numberValue = 10;
    }
}
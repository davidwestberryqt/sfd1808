public class ActionFunctionTestController {
  public String newCase { get; set; }
  public PageReference submit(){
      newCase = 'Case number set';
      System.debug('-----Submit Called-----');
      return null;
  }
}
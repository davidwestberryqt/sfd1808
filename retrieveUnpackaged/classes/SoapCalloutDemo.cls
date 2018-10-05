public class SoapCalloutDemo {
    public static double doAddCallout(){
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        Double result = calculator.doAdd((Double) 5.4, (Double) 14.3);
        return result;
    }
    // public static double doMultiplyCallout(Decimal x, Decimal y){
    //     calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
    //     Double result = calculator.doMultiply((Double) x, (Double) y);
    //     return result;
    // }
}
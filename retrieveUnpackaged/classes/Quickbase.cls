public class Quickbase {
  private string baseURL = 'https://lmisystemsinc.quickbase.com/db/bnfy9yu76?';
  private string queryType;
  private string usertoken = 'b3vqzm_fns3_wxz6gp2nbbxxccxv3usd5brjy2';
  private string apptoken = 'csu2e86dqnyk52dqraeasbgwfx68';
  private string query = '(%7B%276%27.XCT.%27%27%7D)';
  private string clist = '3.6.240.193.238.125.110.142.204.196.84.222.229.120.154.155.188.242.241.47.235.236.237.121.221.230.200.50.37.38.195.218.228.199.190.15.232.233.234.13.208.219.220.134.146.135.136.231.198.207.215.48.210.197.211.2.10.189.11.244.248.245';
  private string num;

  public DoQueryCount_Response DoQueryCount(){
    this.queryType = 'API_DoQueryCount';
    this.num = '99999';
    string URLFind = queryBuilder();

    HttpRequest req = new HttpRequest();
    req.setEndpoint(URLFind);
    req.setMethod('GET');
    req.setHeader('Accept','application/xml');
    Http http = new Http();
    HTTPResponse res = http.send(req);
    return new DoQueryCount_Response(res.getBody());
  }

  public string queryBuilder(){
    return baseURL + 'a=' + queryType + '&usertoken=' + usertoken + '&apptoken=' + apptoken + '&query=' + query + '&clist=' + clist + '&jsa=1&options=num-' + num;
  }

  public class DoQueryCount_Response {
    public string action;
    public integer errcode;
    public string errtext;
    public integer numMatches;

    public DoQueryCount_Response(String response){
      Dom.Document doc = new Dom.Document();
        try {
            doc.load(response);
            Dom.XmlNode rootNode = doc.getRootElement();
            parseResponse(rootNode);
            //System.debug(rootNode.getChildElements());
        } catch(Exception e){
            System.debug(e.getMessage());
        }
    }

    public void parseResponse(Dom.XmlNode node){
      for(Dom.XmlNode child : node.getChildElements()){
        switch on child.getName(){
          when 'action' {
            this.action = child.getText().trim();
          }
          when 'errcode' {
            this.errcode = Integer.valueOf(child.getText().trim());
          }
          when 'errtext' {
            this.errtext = child.getText().trim();
          }
          when 'numMatches' {
            this.numMatches = Integer.valueOf(child.getText().trim());
          }
          when else {
            System.debug('Unable to parse Node ' + child.getName());
          }
        }
      }
    }
  }
}
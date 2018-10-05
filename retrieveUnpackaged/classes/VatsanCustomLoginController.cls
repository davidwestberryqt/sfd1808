global with sharing class VatsanCustomLoginController {
    global String username {get; set;}
    global String password {get; set;}
      String communityUrl = 'https://vatsantest-developer-edition.na17.force.com/CustomLoginVatsan/';
      String customHomePage = '_ui/core/chatter/ui/ChatterPage';

    global VatsanCustomLoginController () {


       }
    global PageReference login() {
        //return new PageReference( '/_ui/core/chatter/ui/ChatterPage');
        return Site.login(username, password, null);


    }
}
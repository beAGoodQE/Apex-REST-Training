@RestResource(urlMapping='/Accounts/*/contacts')
// "with sharing" respects User credentials, field-level security, etc
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result =  [Select Id, Name, (Select Id, FirstName, LastName From Contacts)
                            From Account
                            Where Id = :accountId];
        return result;
    }
}
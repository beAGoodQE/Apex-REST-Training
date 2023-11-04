@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id accountId = createTestAccount();
        createTestContact1(accountId);
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'
            + accountId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account', thisAccount.Name);
    }
    
    // Helper methods
    static Id createTestAccount() {
        // Create test record
        Account accountTest = new Account(
            Name='Test Account');
        insert accountTest;
        return accountTest.Id;
    }
    
    static void createTestContact1(Id accountId) {
        // Create test record
        Contact contactTest = new Contact(
            AccountId = accountId,
            FirstName = 'Test',
            LastName = 'Contact');
        insert contactTest;
    }          
}
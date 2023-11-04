@isTest
// Mock, although not a Test, code that can only be reached in Test context, so no 
// coverage needed, should be global too.
global class AnimalLocatorMock implements HttpCalloutMock {

        global HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('contentType', 'application/json');
            response.setBody('{"animal":{"id":1, "name":"moose", "eats":"plants", "says":"bellows"}}');
            response.setStatusCode(200);
            return response;
        }
}
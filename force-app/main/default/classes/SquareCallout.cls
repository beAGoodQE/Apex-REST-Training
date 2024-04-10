public with sharing class SquareCallout {
    public static HttpResponse makeGetCallout() {
        final String secret = 'Bearer EAAAlotBNgraPu3-x5LlEXd6pzTIggpHm3I5rzCWAzqwsipTT4_PW58xr_GiP6EW';
//        final String email = 'test@test.com';
        final String email = 'kizer4@hotmail.com';
        final String squareVersion = '2024-03-20';

        Http http = new Http();
        
        // Use JSONGenerator to generate the desired JSON text
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeFieldName('query');
        gen.writeStartObject();
        gen.writeFieldName('filter');
        gen.writeStartObject();
        gen.writeFieldName('email_address');
        gen.writeStartObject();
        gen.writeStringField('fuzzy', email);
        gen.writeEndObject(); // Close "email_address" object
        gen.writeEndObject(); // Close "filter" object  
        gen.writeFieldName('sort');
        gen.writeStartObject();
        gen.writeStringField('field', 'CREATED_AT');
        gen.writeStringField('order', 'ASC');
        gen.writeEndObject(); // Close "sort" object
        gen.writeEndObject(); // Close "query" object
        gen.writeNumberField('limit', 2);
        gen.writeEndObject(); // Close the main object

        // Get the JSON string
        String jsonString = gen.getAsString();
        System.debug('BK jsonString: ' + jsonString);
        System.debug('BK pretty: ' + gen.getAsString());
            
        // Create HTTP Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://connect.squareup.com/v2/customers/search');
        request.setMethod('POST');
        request.setHeader('Square-Version', squareVersion);
        request.setHeader('Authorization', secret);
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonString);

        // System.debug('BK 1: ' + request);

        // Send Request and get Response
        HttpResponse response = http.send(request);
        // System.debug('BK 2: ' + response);

        // Process the Response
        if (response.getStatusCode() == 200) {
            System.debug('BK 3: ' + response.getBody());
        }

        // Checks for empty response / no results
        if (-1 == response.getBody().indexOf('email_address')) {
            System.debug('BK 6: JSON Response is empty');
        }

        return response;
    }
}
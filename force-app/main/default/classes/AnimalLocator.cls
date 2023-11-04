public class AnimalLocator {

    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        // If request is successful, parese the JSON response
        Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        Map<String, Object> animal = (Map<String, Object>)result.get('animal');
        System.debug('Name: ' + string.valueOf(animal.get('name')));
        System.debug('Eats: ' + string.valueOf(animal.get('eats')));
        System.debug('Says: ' + string.valueOf(animal.get('says')));
        return string.valueOf(animal.get('name'));
    }
}
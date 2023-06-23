/**
 * Concrete strategy implementation using Google API
 */
public class GoogleBookAPI implements IBookAPI {
    private static final String API_ENDPOINT = 'callout:Google_API';

    // Implemented interface method
    public List<BookData> searchBooks(String query) {
        String endpoint = API_ENDPOINT + '/books/v1/volumes?q=' + EncodingUtil.urlEncode(query, 'UTF-8');
        HttpResponse response = sendRequest('GET', endpoint);

        // TODO ...
        System.debug(response.getBody());

        return new List<BookData>();
    }

    // Implemented interface method
    public List<BookData> getBooks(String[] externalIds) {
        // TODO ...
        return new List<BookData>();
    }

    // Implemented interface method
    public BookData getBook(String externalId) {
        // TODO ...
        return new BookData();
    }

    // HTTP Request method
    private HttpResponse sendRequest(String method, String endpoint) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'key={!$Credential.Password}');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) {
            // throw new GoogleAPIException('Error in API request: ' + response.getBody());
        }

        return response;
    }
}
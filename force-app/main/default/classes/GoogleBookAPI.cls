/**
 * Concrete strategy implementation using Google API
 */
public class GoogleBookAPI implements IBookAPI {
    private static final String API_ENDPOINT = 'callout:Google_API';

    // Implemented interface method
    public List<BookData> searchBooks(String searchTerm) {
        String endpoint = API_ENDPOINT + '/books/v1/volumes?q=' + EncodingUtil.urlEncode(searchTerm, 'UTF-8');
        HttpResponse response = sendRequest('GET', endpoint);

        return parseResponse(response);
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

    // Parse response method
    private List<BookData> parseResponse(HttpResponse response) {
        Map<String, Object> parsedResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        List<Object> items = (List<Object>) parsedResponse.get('items');
        List<BookData> bookDataList = new List<BookData>();

        for (Object item : items) {
            Map<String, Object> book = (Map<String, Object>) item;
            Map<String, Object> volumeInfo = (Map<String, Object>) book.get('volumeInfo');
            List<Object> categories = (List<Object>) volumeInfo.get('categories');
            List<Object> authors = (List<Object>) volumeInfo.get('authors');

            BookData bookData = new BookData();
            bookData.externalId = (String) book.get('id');
            bookData.title = (String) volumeInfo.get('title');
            bookData.description = (String) volumeInfo.get('description');
            bookData.imageUrl = ''; // TODO
            bookData.pageCount = (Integer) volumeInfo.get('pageCount');
            bookData.categories = categories != null ? Util.parseObjectToString(categories) : null;
            bookData.authors = authors != null ? Util.parseObjectToString(authors) : null;

            bookDataList.add(bookData);
        }

        System.debug(bookDataList);
        return bookDataList;
    }
}
/**
 * Concrete strategy implementation using OpenLibrary API
 */
public class OpenLibraryAPI implements IBookAPI {
    private static final String API_ENDPOINT = 'callout:OpenLibrary_API';

    // Implemented interface method
    public BookDataList searchBooks(String searchTerm, Integer startIndex, Integer maxResults) {
        String endpoint = API_ENDPOINT + '/search.json?q=' + EncodingUtil.urlEncode(searchTerm, 'UTF-8');
        endpoint += '&has_fulltext=' + true + '&offset=' + startIndex + '&limit=' + maxResults;
        
        HttpResponse response = sendRequest('GET', endpoint);

        return parseResponse(response);
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
        request.setMethod(method);

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) {
            // throw new OpenLibraryAPIException('Error in API request: ' + response.getBody());
        }

        return response;
    }

    // Parse response method
    private BookDataList parseResponse(HttpResponse response) {
        Map<String, Object> parsedResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        List<Object> docs = (List<Object>) parsedResponse.get('docs');
        List<BookData> results = new List<BookData>();

        for (Object doc : docs) {
            Map<String, Object> book = (Map<String, Object>) doc;
            List<Object> authors = (List<Object>) book.get('author_name');
            List<Object> categories = (List<Object>) book.get('subject');

            BookData bookData = new BookData();
            bookData.externalId = (String) book.get('key');
            bookData.title = (String) book.get('title');
            bookData.description = ''; // Not provided by the API
            bookData.imageUrl = ''; // TODO
            bookData.pageCount = (Integer) book.get('number_of_pages_median');
            bookData.categories = categories != null ? Util.parseObjectToString(categories) : null;
            bookData.authors = authors != null ? Util.parseObjectToString(authors) : null;

            results.add(bookData);
        }

        BookDataList bookDataList = new BookDataList();
        bookDataList.totalResults = (Integer) parsedResponse.get('numFound');
        bookDataList.results = results;

        return bookDataList;
    }
}
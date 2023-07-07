/**
 * Concrete strategy implementation using Marvel API
 */
public class MarvelAPI implements IBookAPI {
    private static final String API_ENDPOINT = 'https://gateway.marvel.com';
    private static final API_Key__mdt PUBLIC_KEY  = [SELECT Key__c FROM API_Key__mdt WHERE DeveloperName = 'Marvel_Public_API_Key' LIMIT 1];
    private static final API_Key__mdt PRIVATE_KEY = [SELECT Key__c FROM API_Key__mdt WHERE DeveloperName = 'Marvel_Private_API_Key' LIMIT 1];

    // Implemented interface method
    public BookDataList searchBooks(String searchTerm, Integer startIndex, Integer maxResults) {
        String endpoint = API_ENDPOINT + '/v1/public/comics?titleStartsWith=' + EncodingUtil.urlEncode(searchTerm, 'UTF-8');
        endpoint += '&offset=' + startIndex + '&limit=' + maxResults;
        
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
        endpoint = addAuthenticationParams(endpoint);

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod(method);

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) {
            // throw new GoogleAPIException('Error in API request: ' + response.getBody());
        }

        return response;
    }

    // Parse response method
    private BookDataList parseResponse(HttpResponse response) {
        Map<String, Object> parsedResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> data = (Map<String, Object>) parsedResponse.get('data');
        List<Object> items = (List<Object>) data.get('results');
        List<BookData> results = new List<BookData>();

        for (Object item : items) {
            Map<String, Object> comic = (Map<String, Object>) item;
            List<Object> categories = null; // TODO
            List<Object> authors = null; // TODO

            BookData bookData = new BookData();
            bookData.externalId = String.valueOf((Integer) comic.get('id'));
            bookData.title = (String) comic.get('title');
            bookData.description = (String) comic.get('description');
            bookData.imageUrl = ''; // TODO
            bookData.pageCount = (Integer) comic.get('pageCount');
            bookData.categories = categories != null ? Util.parseObjectToString(categories) : null;
            bookData.authors = authors != null ? Util.parseObjectToString(authors) : null;

            results.add(bookData);
        }

        BookDataList bookDataList = new BookDataList();
        bookDataList.totalResults = (Integer) data.get('total');
        bookDataList.results = results;

        return bookDataList;
    }

    private String addAuthenticationParams(String endpoint) {
        // Generate hash and add authentication parameters to the endpoint
        String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
        Blob hashBlob = Crypto.generateDigest('MD5', Blob.valueOf(timestamp + PRIVATE_KEY.Key__c + PUBLIC_KEY.Key__c));
        String hashString = EncodingUtil.convertToHex(hashBlob);
        endpoint += '&apikey=' + PUBLIC_KEY.Key__c + '&ts=' + timestamp + '&hash=' + hashString;

        return endpoint;
    }
}
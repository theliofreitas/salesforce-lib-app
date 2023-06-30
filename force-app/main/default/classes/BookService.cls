/**
 * Context strategy class
 */
public class BookService {
    private IBookAPI bookAPI;

    public void setBookAPI(IBookAPI bookApi) {
        this.bookAPI = bookApi;
    }

    public BookDataList searchBooks(String searchTerm, Integer startIndex, Integer maxResults) {
        return bookAPI.searchBooks(searchTerm, startIndex, maxResults);
    }

    public BookData getBook(String externalId) {
        return bookAPI.getBook(externalId);
    }
}
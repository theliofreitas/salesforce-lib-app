/**
 * Context strategy class
 */
public class BookService {
    private IBookAPI bookAPI;

    public void setBookAPI(IBookAPI bookApi) {
        this.bookAPI = bookApi;
    }

    public List<BookData> searchBooks(String searchTerm) {
        return bookAPI.searchBooks(searchTerm);
    }

    public List<BookData> getBooks(String[] externalIds) {
        return bookAPI.getBooks(externalIds);
    }

    public BookData getBook(String externalId) {
        return bookAPI.getBook(externalId);
    }
}
/**
 * Common interface to all concrete strategies
 */
public interface IBookAPI {
    List<BookData> searchBooks(String searchTerm);
    List<BookData> getBooks(String[] externalIds);
    BookData getBook(String externalId);
}
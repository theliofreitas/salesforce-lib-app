/**
 * Common interface to all concrete strategies
 */
public interface IBookAPI {
    List<BookData> searchBooks(String query);
    List<BookData> getBooks(String[] externalIds);
    BookData getBook(String externalId);
}
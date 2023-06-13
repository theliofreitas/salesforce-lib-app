public class BorrowingHelper {
    public static void updateBookCopyStatus(List<Borrowing__c> borrowings) {
        List<Book_Copy__c> bookCopiesToUpdate = new List<Book_Copy__c>();

        for(Borrowing__c borrowing : borrowings) {
            Book_Copy__c bookCopy = new Book_Copy__c();
            bookCopy.Id = borrowing.Book_Copy__c;

            switch on borrowing.Status__c {
                when 'Scheduled' {
                    bookCopy.Status__c = 'Reserved';
                }
                when 'In progress' {
                    bookCopy.Status__c = 'Borrowed';
                }
                when 'Closed' {
                    if(borrowing.Devolution_Status__c == 'Returned') {
                        bookCopy.Status__c = 'Available';
                    } else if(borrowing.Devolution_Status__c == 'Damaged') {
                        bookCopy.Status__c = 'Damaged';
                    } else if(borrowing.Devolution_Status__c == 'Missed') {
                        bookCopy.Status__c = 'Missing';
                    }
                }
            }

            bookCopiesToUpdate.add(bookCopy);
        }

        update bookCopiesToUpdate;
    }
}
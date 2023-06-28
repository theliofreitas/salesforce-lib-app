import { LightningElement, api } from 'lwc';
import searchBooks from '@salesforce/apex/BookImporterController.searchBooks';

export default class BookImporter extends LightningElement {
    @api searchTerm = '';
    @api searchResults = [];

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }

    handleSearch() {
        this.searchResults = searchBooks(this.searchTerm);
        console.log(this.searchResults);
    }
}
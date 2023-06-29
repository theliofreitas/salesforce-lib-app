import { LightningElement, api } from 'lwc';
import searchBooks from '@salesforce/apex/BookImporterController.searchBooks';

export default class BookImporter extends LightningElement {
    @api searchTerm = '';
    searchResults;

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }

    handleSearch() {
        searchBooks({ searchTerm: this.searchTerm, api: 'GoogleBookAPI' })
            .then(results => {
                this.searchResults = results;
                console.log(results);
            })
            .catch(error => {
                // Handle any error that occurred
                console.error('Error calling Apex method:', error);
            });
    }
}
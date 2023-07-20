import { LightningElement, api } from 'lwc';
import searchBooks from '@salesforce/apex/BookImporterController.searchBooks';

export default class BookImporter extends LightningElement {
    @api searchTerm = 'Alice';
    @api source = 'GoogleBookAPI';
    searchResults;
    startIndex = 0;
    maxResults = 15;

    get sourceOptions() {
        return [
            { label: 'Google Books', value: 'GoogleBookAPI' },
            { label: 'Open Library', value: 'OpenLibraryAPI' },
            { label: 'Marvel', value: 'MarvelAPI' },
        ];
    }

    renderedCallback() {
        this.setFocus();
    }
    
    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }

    handleSourceChange(event) {
        this.source = event.target.value;
    }

    handleSearch() {
        searchBooks({ searchTerm: this.searchTerm, startIndex: this.startIndex, maxResults: this.maxResults, api: this.source })
            .then(response => {
                this.searchResults = response.results;
                console.log(response.totalResults);
                console.log(response.results);
            })
            .catch(error => {
                // Handle any error that occurred
                console.error('Error calling Apex method:', error);
            });
    }

    handleNextPage() {
        this.startIndex = this.startIndex + this.maxResults;
        this.handleSearch();
    }

    setFocus() {
        let element = this.template.querySelector("lightning-input[data-fieldname='search']");
        console.log('Focus on: ' + element);
        element.focus();
    }
}
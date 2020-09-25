(function(){
    AssignmentJsLib.showGrid.call({
        dataUrl: 'Book',
        gridStyle: 'user',
        componentId: 'book',
        gridColumns:[{
            header: 'Name',
            dataIndex: 'name'
        },{
            header: 'BookId',
            dataIndex: 'bookId'
        },{
             header: 'Author',
            dataIndex: 'author'
        },{
             header: 'Title',
             dataIndex: 'title'
        },{
        header: 'Price.',
        dataIndex: 'price'
         }],



        gridButtons: [{
            label: 'submit',
            cssClass: 'addButton',
            handler: 'addButton',
            id: 'book-addButton',
        }],
        formField: [{
            label: 'Name',
            name: 'name',
            type: 'text',
            id: 'book-name'
        },{
            label: 'BookId',
            name: 'bookId',
            type: 'text',
            id: 'book-bookId'
        } ,{
              label: 'Author',
              name: 'author',
              type: 'text',
              id: 'book-author'
          },{
            label: 'Title',
            name: 'title',
            type: 'text',
            id: 'book-title'
        },{
             label: 'Price',
             name: 'price',
             type: 'text',
             id: 'book-price'
         }]
    });
})();
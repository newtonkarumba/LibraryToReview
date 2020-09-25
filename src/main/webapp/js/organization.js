(function(){
    AssignmentJsLib.showGrid.call({
        dataUrl: 'Student',
        gridStyle: 'user',
        componentId: 'Student',
        gridColumns:[{
            header: 'Name',
            dataIndex: 'name'
        },{
            header: 'Address',
            dataIndex: 'address'
        },{
             header: 'Id',
            dataIndex: 'id'
        },{
             header: 'Registration No.',
             dataIndex: 'regNo'
        },{
        header: 'ExpiryDate.',
        dataIndex: 'expiryDate'
         }],



        gridButtons: [{
            label: 'Submit',
            cssClass: 'addButton',
            handler: 'addButton',
            id: 'org-addButton',
        }],
        formField: [{
            label: 'Name',
            name: 'name',
            type: 'text',
            id: 'org-name'
        },{
            label: 'Address',
            name: 'address',
            type: 'text',
            id: 'org-address'
        } ,{
              label: 'ID',
              name: 'id',
              type: 'text',
              id: 'org-id'
          },{
            label: 'RegNo.',
            name: 'regNo',
            type: 'text',
            id: 'org-regNo'
        },{
             label: 'ExpiryDate',
             name: 'expiryDate',
             type: 'text',
             id: 'org-expiryDate'
         }]
    });
})();
var AssignmentJsLib = AssignmentJsLib || {};

AssignmentJsLib.showGrid = function(){
    var me = this;

    var xhr = new XMLHttpRequest();

    var requestResponse = [];


    xhr.onreadystatechange = function(){
        if (xhr.readyState == XMLHttpRequest.DONE){
            if (xhr.status == 200){
                requestResponse = eval('(' + xhr.responseText + ')');

            }
        }
    }

    xhr.open('get', me.dataUrl, false);
    xhr.send();

    me.gridData = requestResponse;

    var tableContent = ``;
    me.gridButtons.forEach(button => {
        tableContent += `<button class="button ${button.cssClass}" id="${button.id}">${button.label}</button>`;
    });

   tableContent += `<br/><table class='${me.gridStyle}'><tr>`;

    me.gridColumns.forEach(col => {
        tableContent += `<th>${col.header}</th>`;
    });
    tableContent += `</tr>`;

    me.gridData.forEach(row => {

        tableContent += `<tr>`;

        me.gridColumns.forEach(col => {
            tableContent += `<td>${row[col.dataIndex]}</td>`;
        });

        tableContent += `</tr>`;
    });

    tableContent += `</table>`;

    document.getElementById('module-content').innerHTML = tableContent;

    me.gridButtons.forEach(button => {
        console.log('Registing event for adding form');
        if (button.handler == 'addButton')
            document.getElementById(button.id).addEventListener('click', function(){
               AssignmentJsLib.Form.call(me);
            });

    });

}

AssignmentJsLib.Form = function(){
    var me = this;

    var formContent = `<form action="#">`;

    me.formField.forEach(field =>{
      formContent += `<div class="row">`
            + `<div class="col-25">`
                + `<label for="${field.name}">${field.label}</label>`
            + `</div>`
            + `<div class="col-75">`
                + `<input type="${field.type}" id="${field.id}" name="${field.name}">`
            + `</div>`
        + `</div>`;

    });

    formContent +=  `<div class="row">`
                + `<input type="submit" value="Submit" id="${me.componentId}">`
            + `</div>`
        + ` </form>`;

    document.getElementById('studentContent').innerHTML = formContent;

    document.getElementById(me.componentId).addEventListener('click', event => {
        event.preventDefault();

        var formData = '';
        me.formField.forEach(field =>{
            formData += field.name + '=' + document.getElementById(field.id).value + '&';
        });

        var xhr = new XMLHttpRequest();

        var requestResponse = [];
        xhr.onreadystatechange = function(){
            if (xhr.readyState == XMLHttpRequest.DONE){
                if (xhr.status == 200){
                    requestResponse = eval('(' + xhr.responseText + ')');

                }
            }
        }

        console.log(formData);

        xhr.open('post', me.dataUrl, false);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(formData);

        AssignmentJsLib.showGrid.call(me);

    });
}

AssignmentJsLib.view = function(){

   var me = this;

    var xhr = new XMLHttpRequest();

    var requestResponse = " ";


    xhr.onreadystatechange = function(){
        if (xhr.readyState == XMLHttpRequest.DONE){
            if (xhr.status == 200){
                requestResponse = xhr.responseText; //eval('(' + xhr.responseText + ')');
                 //document.getElementById('studentContent').innerHTML = requestResponse;
            }
        }
    }

    xhr.open('get',"Student" , false);
    xhr.send();

    me.gridData = requestResponse;

    var tableContent = ``;
    me.gridButtons.forEach(button => {
        tableContent += `<button class="button ${button.cssClass}" id="${button.id}">${button.label}</button>`;
    });

   tableContent += `<br/><table class='${me.gridStyle}'><tr>`;

    me.gridColumns.forEach(col => {
        tableContent += `<th>${col.header}</th>`;
    });
    tableContent += `</tr>`;

    me.gridData.forEach(row => {

        tableContent += `<tr>`;

        me.gridColumns.forEach(col => {
            tableContent += `<td>${row[col.dataIndex]}</td>`;
        });

        tableContent += `</tr>`;
    });

    tableContent += `</table>`;

    document.getElementById('studentContent').innerHTML = tableContent;

    me.gridButtons.forEach(button => {
        console.log('Registing event for adding form');
        if (button.handler == 'addButton')
            document.getElementById(button.id).addEventListener('click', function(){
                AssignmentJsLib.Form.call(me);
            });

    });

}

AssignmentJsLib.viewBook = function(){

   var me = this;

    var xhr = new XMLHttpRequest();

    var requestResponse = " ";


    xhr.onreadystatechange = function(){
        if (xhr.readyState == XMLHttpRequest.DONE){
            if (xhr.status == 200){
                requestResponse = xhr.responseText; //eval('(' + xhr.responseText + ')');
                 document.getElementById('bookContent').innerHTML = requestResponse;
            }
        }
    }

    xhr.open('get',"Book" , false);
    xhr.send();


}

AssignmentJsLib.add = function(){

    var me = this;

    var params = me.params;

    var xhr = new XMLHttpRequest();

    var requestResponse = "";


    xhr.onreadystatechange = function(){
        if (xhr.readyState == XMLHttpRequest.DONE){
            if (xhr.status == 200){
                requestResponse = eval('(' + xhr.responseText + ')');
              //   me.callback(requestResponse);
            }
        }
    }

    xhr.open(me.method,'Student', false);

     xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhr.send(params);


}

AssignmentJsLib.addBook = function(){

    var me = this;

    var params = me.params;

    var xhr = new XMLHttpRequest();

    var requestResponse = "";


    xhr.onreadystatechange = function(){
        if (xhr.readyState == XMLHttpRequest.DONE){
            if (xhr.status == 200){
                requestResponse = eval('(' + xhr.responseText + ')');
                 me.callback(requestResponse);
            }
        }
    }

    xhr.open(me.method,"Book" , false);
    //xhr.send();
     xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhr.send(params);


}

AssignmentJsLib.Form = function(){
    var me = this;

    var formContent = `<form action="#">`;

    me.formField.forEach(field =>{
      formContent += `<div class="row">`
            + `<div class="col-25">`
                + `<label for="${field.name}">${field.label}</label>`
            + `</div>`
            + `<div class="col-75">`
                + `<input type="${field.type}" id="${field.id}" name="${field.name}">`
            + `</div>`
        + `</div>`;

    });

    formContent +=  `<div class="row">`
                + `<input type="submit" value="Submit" id="${me.componentId}">`
            + `</div>`
        + ` </form>`;

    document.getElementById('studentContent').innerHTML = formContent;

    document.getElementById(me.componentId).addEventListener('click', event => {
        event.preventDefault();

        var formData = '';
        me.formField.forEach(field =>{
            formData += field.name + '=' + document.getElementById(field.id).value + '&';
        });

        var xhr = new XMLHttpRequest();

        var requestResponse = [];
        xhr.onreadystatechange = function(){
            if (xhr.readyState == XMLHttpRequest.DONE){
                if (xhr.status == 200){
                    requestResponse = eval('(' + xhr.responseText + ')');

                }
            }
        }

        console.log(formData);

        xhr.open('post', me.dataUrl, false);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send(formData);

        AssignmentJsLib.showGrid.call(me);

    });
}
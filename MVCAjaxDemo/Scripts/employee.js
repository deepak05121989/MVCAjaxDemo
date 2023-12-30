$(document).ready(function () {
    loadData();
    $(".btn").click(function () {
        $('#myModal').modal('hide');
    });
    $(".close").click(function () {
        $('#myModal').modal('hide');
    });
});
function loadData() {
    $.ajax({
        url: "/Employee/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            debugger;
            var html = '';
           
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.EmployeeId + '</td>';
                html += '<td>' + item.EmployeeName + '</td>';
                html += '<td>' + item.EmployeeEmail + '</td>';
                html += '<td>' + item.EmployeeSalary + '</td>';
                html += '<td>' + item.EmployeeMobile + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.EmployeeId + ')">Edit</a> | <a href="#" onclick="Delele(' + item.EmployeeId + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        EmployeeId: $('#EmployeeId').val(),
        EmployeeName: $('#EmployeeName').val(),
        EmployeeEmail: $('#EmployeeEmail').val(),
        EmployeeSalary: $('#EmployeeSalary').val(),
        EmployeeMobile: $('#EmployeeMobile').val()
    };
    $.ajax({
        url: "/Employee/Add",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getbyID(Id) {
    $('#EmployeeName').css('border-color', 'lightgrey');
    $('#EmployeeEmail').css('border-color', 'lightgrey');
    $('#EmployeeSalary').css('border-color', 'lightgrey');
    $('#EmployeeMobile').css('border-color', 'lightgrey');
    $.ajax({
        url: "/Employee/getbyID/" + Id,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#EmployeeId').val(result.EmployeeId);
            $('#EmployeeName').val(result.EmployeeName);
            $('#EmployeeEmail').val(result.EmployeeEmail);
            $('#EmployeeSalary').val(result.EmployeeSalary);
            $('#EmployeeMobile').val(result.EmployeeMobile);
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        Id: $('#EmployeeId').val(),
        Name: $('#EmployeeName').val(),
        Age: $('#EmployeeEmail').val(),
        State: $('#EmployeeSalary').val(),
        Country: $('#EmployeeMobile').val(),
    };
    $.ajax({
        url: "/Employee/Update",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#EmployeeId').val("");
            $('#EmployeeName').val("");
            $('#EmployeeEmail').val("");
            $('#EmployeeSalary').val("");
            $('#EmployeeMobile').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function Delele(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Employee/Delete/" + ID,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
function clearTextBox() {
    $('#EmployeeId').val("");
    $('#EmployeeName').val("");
    $('#EmployeeEmail').val("");
    $('#EmployeeSalary').val("");
    $('#EmployeeMobile').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#EmployeeName').css('border-color', 'lightgrey');
    $('#EmployeeEmail').css('border-color', 'lightgrey');
    $('#EmployeeSalary').css('border-color', 'lightgrey');
    $('#EmployeeMobile').css('border-color', 'lightgrey');
    $('#myModal').modal('show');
}
function validate() {
    var isValid = true;
    if ($('#EmployeeName').val().trim() == "") {
        $('#EmployeeName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#EmployeeName').css('border-color', 'lightgrey');
    }
    if ($('#EmployeeEmail').val().trim() == "") {
        $('#EmployeeEmail').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#EmployeeEmail').css('border-color', 'lightgrey');
    }
    if ($('#EmployeeSalary').val().trim() == "") {
        $('#EmployeeSalary').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#EmployeeSalary').css('border-color', 'lightgrey');
    }
    if ($('#EmployeeMobile').val().trim() == "") {
        $('#EmployeeMobile').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#EmployeeMobile').css('border-color', 'lightgrey');
    }
    return isValid;
}
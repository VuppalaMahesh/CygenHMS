function save_floor(data, call_back){
    $.ajax({
 type: "POST",
 url: "/floors/",
 data: JSON.stringify(data),
 contentType: "application/json",
 dataType: "json",
 success: function (data, status) {
        call_back(data,status);
    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
                return false;
              }
});
}
function get_floor_data(call_back){
         $.ajax({
             type: "GET",
             url: "/floors/",
             contentType: "application/json",
             dataType: "json",
             success: function (data, status) {
                    call_back(data,status);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                return false;
              }
        });
}

function save_ward(data, call_back){
    $.ajax({
 type: "POST",
 url: "/wards/",
 data: JSON.stringify(data),
 contentType: "application/json",
 dataType: "json",
 success: function (data, status) {
        call_back(data,status);
    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
                return false;
              }
});
}
function get_ward_data(call_back){
         $.ajax({
             type: "GET",
             url: "/wards/",
             contentType: "application/json",
             dataType: "json",
             success: function (data, status) {
                    call_back(data,status);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                return false;
              }
        });
}

function save_occutype(data, call_back){
    $.ajax({
 type: "POST",
 url: "/occutypes/",
 data: JSON.stringify(data),
 contentType: "application/json",
 dataType: "json",
 success: function (data, status) {
        call_back(data,status);
    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
                return false;
              }
});
}
function get_occutype_data(call_back){
         $.ajax({
             type: "GET",
             url: "/occutypes/",
             contentType: "application/json",
             dataType: "json",
             success: function (data, status) {
                    call_back(data,status);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                return false;
              }
        });
}
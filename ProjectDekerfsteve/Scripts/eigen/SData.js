$(document).ready(
    $(function getRest() {
        $.ajax({
            type: "POST",
            url: "Subscribe.cshtml/getRest",
            data: "{}",
            datatype: "Json",
            contentType: "application/json; charset=utf-8",
            succes: OnSucces
        });

    });
    $(function OnSucces(data) {
        var TableContent = "<p>aantal_personen</p>";
    })
    function OnError(data) {
        
    }
)
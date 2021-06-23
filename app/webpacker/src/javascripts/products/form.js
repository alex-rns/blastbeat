window.$ = require("jquery")
$(document).on("turbolinks:load", () => {
    $("textarea.autosize-input").each((index, elem) => {
        resize(elem);
    });
    function resize(text){
        text.style.height = 'auto';
        text.style.height = text.scrollHeight + 5 +'px';
    }
})
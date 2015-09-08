$(document).ready(function() {
    var input, summer_note;
    summer_note = $('#category_desc');
    input = $('#category_desc');
    summer_note.summernote({
      height: 500,
      lang: 'ko-KR',
      codemirror: {
        lineNumbers: true,
        tabSize: 2,
        theme: "solarized light"
      }
    });
    summer_note.code(summer_note.val());
    return summer_note.closest('form').submit(function() {
      summer_note.val(summer_note.code());
      return true;
    });
});

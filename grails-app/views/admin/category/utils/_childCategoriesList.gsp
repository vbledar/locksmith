<g:select id="childCategory"
          name="child"
          class="form-control"
          from="${childCategories}"
          optionKey="id"
          noSelection="${['null': message(code: 'admin.parent.category.selection', default: 'Όλες')]}"
          value="${params.child}"
          related-form="filter-category-items"/>


<script type="text/javascript">
    $(function() {
        $('#childCategory').off('change').on('change', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // retrieve related form and submit it
            var formId = $(this).attr('related-form');
            $('#'+formId).submit();
        });
    })
</script>
$(document).ready(function () {

    $(".checkbox").click(function () {

        var chb = $(this);
        var training_item_id = chb.attr('id')
        if ($(this).prop('checked')) {
            console.log(training_item_id)
            console.log(' checked')
            $.ajax({
                url: '/training_plan_items/' + training_item_id + '/mark_finished',
                type: 'post'
            })
        }
        else {
            console.log(' unchecked')
            console.log(training_item_id)
            $.ajax({
                url: '/training_plan_items/' + training_item_id + '/mark_unfinished',
                type: 'post'
            })
        }
        ;
    });
});

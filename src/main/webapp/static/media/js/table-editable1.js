
var TableEditable = function () {
    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input id="news_id" type="text" class="m-wrap small" value="' + aData[0] + '">';
                jqTds[0].innerHTML = '<input id="news_title" type="text" class="m-wrap small" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input id="news_source" type="text" class="m-wrap small" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input id="news_time" type="text" class="m-wrap small" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input id="news_type" type="text" class="m-wrap small" value="' + aData[3] + '">';
                jqTds[4].innerHTML = '<input id="news_content" type="text" class="m-wrap small" value="' + aData[4] + '">';   
                jqTds[5].innerHTML = '<a id="shaoshuai" href="" >save</a>';
                jqTds[6].innerHTML = '<a class="" href="">Cancel</a>';

                document.getElementById('shaoshuai').addEventListener('click', function(e) {
                    //alert("121");
                    var obj={1:$("#news_title").val(),2:$("#news_source").val(),
                        3:$("#news_time").val(),4:$("#news_type").val(),5:$("#news_content").val(),
                   };
                    alert(obj[1]);
                    var str = JSON.stringify(obj);
                    var news_id = $("#news_id").val();
                    var news_title = $("#news_title").val();
                    var news_source = $("#news_source").val();
                    var news_time = $("#news_time").val();
                    var news_type = $("#news_type").val();
                    var news_content = $("#news_content").val();   
                   
                    $.ajax({
                        url:'InsertNews',
                        cache:false,
                        type:'post',
                        async:false,
                        dataType:'html',
                        data:{
                            trainSortieListStr:str,
                            "news_title":news_title,
                            "news_source":news_source,
                            "news_time":news_time,
                            "news_type":news_type,
                            "news_content":news_content,
                            contentType: "application/x-www-form-urlencoded;charset=utf-8"
                        },
                        success:function (msg){
                            if(msg == 'success'){alert('success');};
                        }

                    })



                    // 当<a>触发click时，处理业务
                }, false);

            }


            function saveOperationRow(){
                alert(12345678);
                $.ajax({
                    type : 'post',
                    url : '/InsertNews',
                    success:function (msg){
                        if(msg == 'success'){alert(1);}}});
            }
            function saveRow(oTable, nRow) {
                alert(1);
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
                oTable.fnUpdate(jqInputs[5].value, nRow, 5, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 6, false);
                oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 7, false);
                oTable.fnDraw();
            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
                oTable.fnUpdate(jqInputs[5].value, nRow, 5, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 6, false);
                oTable.fnDraw();
            }

            var oTable = $('#sample_editable_1').dataTable({
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength":5,
                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ records per page",
                    "oPaginate": {
                        "sPrevious": "前一页",
                        "sNext": "下一页"
                    }
                },
                "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }
                ]
            });

            jQuery('#sample_editable_1_wrapper .dataTables_filter input').addClass("m-wrap medium"); // modify table search input
            jQuery('#sample_editable_1_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#sample_editable_1_wrapper .dataTables_length select').select2({
                showSearchInput : false //hide search box with special css class
            }); // initialzie select2 dropdown

            var nEditing = null;

            $('#sample_editable_1_new').click(function (e) {
                e.preventDefault();
                var aiNew = oTable.fnAddData(['', '', '', '','','','',
                    '<a class="" href=""></a>', '<a class="cancel" data-mode="new" href=""></a>'
                ]);
                var nRow = oTable.fnGetNodes(aiNew[0]);
                editRow(oTable, nRow);
                nEditing = nRow;
            });



            $('#sample_editable_1 a.delete').live('click', function (e) {
                e.preventDefault();

                if (confirm("Are you sure to delete this row ?") == false) {
                    return;
                }

                var nRow = $(this).parents('tr')[0];
                oTable.fnDeleteRow(nRow);
                alert("Deleted! Do not forget to do some ajax to sync with backend :)");
            });

            $('#sample_editable_1 a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });

            $('#sample_editable_1 a.edit').live('click', function (e) {
                e.preventDefault();

                /* Get the row as a parent of the link that was clicked on */
                var nRow = $(this).parents('tr')[0];

                if (nEditing !== null && nEditing != nRow) {
                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    restoreRow(oTable, nEditing);
                    editRow(oTable, nRow);
                    nEditing = nRow;
                } else if (nEditing == nRow && this.innerHTML == "Save") {
                    /* Editing this row and want to save it */
                    saveRow(oTable, nEditing);
                    nEditing = null;
                    alert("Updated! Do not forget to do some ajax to sync with backend :)");
                } else {
                    /* No edit in progress - let's start one */
                    editRow(oTable, nRow);
                    nEditing = nRow;
                }
            });
        }

    };

}();
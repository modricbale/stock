
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
                jqTds[0].innerHTML = '<input id="u_id" type="text" class="m-wrap small" value="' + aData[0] + '">';
                jqTds[0].innerHTML = '<input id="u_name" type="text" class="m-wrap small" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input id="u_psd" type="text" class="m-wrap small" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input id="u_type" type="text" class="m-wrap small" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input id="u_nickname" type="text" class="m-wrap small" value="' + aData[3] + '">';
                jqTds[4].innerHTML = '<input id="u_sex" type="text" class="m-wrap small" value="' + aData[4] + '">';
                jqTds[5].innerHTML = '<input id="u_email" type="text" class="m-wrap small" value="' + aData[5] + '">';
                jqTds[6].innerHTML = '<input id="u_phone" type="text" class="m-wrap small" value="' + aData[6] + '">';
                jqTds[7].innerHTML = '<input id="u_introduce" type="text" class="m-wrap small" value="' + aData[7] + '">';
                jqTds[8].innerHTML = '<a id="shaoshuai" href="http://localhost:8080/stock/index" >save</a>';
                jqTds[9].innerHTML = '<a class="" href="">Cancel</a>';
              
                document.getElementById('shaoshuai').addEventListener('click', function(e) {
                	//alert("121");
                	 var obj={1:$("#u_name").val(),2:$("#u_psd").val(),
                     		3:$("#u_type").val(),4:$("#u_nickname").val(),5:$("#u_sex").val(),
                     		6:$("#u_email").val(),7:$("#u_phone").val(),8:$("#u_introduce").val()};
                 	 alert(obj[1]);
                	 var str = JSON.stringify(obj);
                	 var u_id = $("#u_id").val();
                	 var u_name = $("#u_name").val();
                	 var u_psd = $("#u_psd").val();
                	 var u_type = $("#u_type").val();
                	 var u_nickname = $("#u_nickname").val();
                	 var u_sex = $("#u_sex").val();
                	 var u_email = $("#u_email").val();
                	 var u_phone = $("#u_phone").val();
                	 var u_introduce = $("#u_introduce").val();
                	 $.ajax({  
                         url:'InsertUser?u_id='+u_id+'&u_name='+u_name+'&u_psd='+u_psd+'&u_type='+u_type+
                         '&u_nickname='+u_nickname+'&u_sex='+u_sex+'&u_email='+u_email+'&u_phone='+u_phone+'&u_introduce='+u_introduce,  
                            cache:false,  
                            type:'post',  
                            async:false,
                            dataType:'html',      
                            data:{   
                          	  trainSortieListStr:str,  
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
                	url : '/InsertUser',
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
                oTable.fnUpdate(jqInputs[6].value, nRow, 6, false);
                oTable.fnUpdate(jqInputs[7].value, nRow, 7, false);
                oTable.fnUpdate(jqInputs[8].value, nRow, 8, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 9, false);
                oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 10, false);
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
                oTable.fnUpdate(jqInputs[6].value, nRow, 6, false);
                oTable.fnUpdate(jqInputs[7].value, nRow, 7, false);
                oTable.fnUpdate(jqInputs[8].value, nRow, 8, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 9, false);
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
                var aiNew = oTable.fnAddData(['', '', '', '','','','','','','',
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
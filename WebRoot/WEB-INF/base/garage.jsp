<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/inc/common.inc.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
<div class="panel panel-success">
	<div class="panel-heading">
		
		<ol class="breadcrumb">
		  <li><span class="text-primary">基础信息</span></li>
		  <li class="active">车库信息</li>
		</ol>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table id="sample-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>车库面积</th>
						<th>车库费用</th>
						<th></th>
					</tr>
				</thead>

			</table>
		</div>

		<div>
			<a href="${path }/garage/addPage.action" class="btn btn-success">添加车库信息</a>
		</div>
	</div>
</div>

<script type="text/javascript">

//dataTable
var table = $('#sample-table').DataTable({
	"ordering": false,
	"searching": false,
	"serverSide": true,
    "ajax": '${path }/garage/page.action',
    
    
    "columns": [
           { "data": "garageId" },
           { "data": "garageArea" },
           { "data": "garageFee" },
           
           { 
           	"data": "garageId",
            "render": function(data) {
            	var eidthref = '${path }/garage/updatePage.action?data='+data;
            	
            	var edita = '<a class="edit green" href="'+eidthref+'"><i class="fa fa-pencil bigger-130"></i></a>';
            	var dela = '<a class="del red" href="#" onClick="delconfirm('+data+')"><i class="fa fa-trash bigger-130"></i></a>';
            	return '<div class="action-buttons">'+ edita + dela +'</div>';
        	}, 
       	}
       ],
  
  
       "language": {
        "processing": "处理中...",
        "lengthMenu": "显示 _MENU_ 项结果",
        "zeroRecords": "没有匹配结果",
        "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
        "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
        "infoFiltered": "(由 _MAX_ 项结果过滤)",
        "infoPostFix": "",
        "search": "搜索:",
        "searchPlaceholder": "搜索...",
        "url": "",
        "emptyTable": "表中数据为空",
        "loadingRecords": "载入中...",
        "infoThousands": ",",
        "paginate": {
            "first": "首页",
            "previous": "上页",
            "next": "下页",
            "last": "末页"
        },
        "aria": {
            "paginate": {
                first: '首页',
                previous: '上页',
                next: '下页',
                last: '末页'
            },
            "sortAscending": ": 以升序排列此列",
            "sortDescending": ": 以降序排列此列"
        },
        "decimal": "-",
        "thousands": "."
   },
   
});



//删除确认
function delconfirm(data){
$.confirm({
    title: '删除',
    content: '是否删除该数据，序号'+data,
    confirmButton: '确认',
  	cancelButton: '取消',
    confirmButtonClass: 'btn-danger',
   	cancelButtonClass: 'btn-info',
    confirm: function(){
    	var delhref = '${path }/garage/delete.action';
    	$.post(delhref, {garageId:data},function(data){
    		if (data == '1') {
    			table.ajax.reload( null, false );
				$.confirm({
				    title: '提示信息',
				    content: '删除成功',
				    confirmButton: 'OK',
				    cancelButton: false,
				    autoClose: 'confirm|2000',
				});
				
			}else if (data == '0') {
				$.alert({
				    title: '警告',
				    content: '内部发生错误，删除失败',
				    confirmButton: '我知道了',
				    confirmButtonClass: 'btn-info'
				});
			}
    	});
    },
});
}
</script>
</body>
</html>
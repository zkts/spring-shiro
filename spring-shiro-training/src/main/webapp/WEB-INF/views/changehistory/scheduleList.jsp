<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp"%>
<meta http-equiv="X-UA-Compatible" content="edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>十三所二三〇厂服务器台账</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {

		dataGrid = $('#dataGrid')
				.datagrid(
						{
							url : '${path }/changeOrder/dataGrid',
							fit : true,
							striped : true,
							rownumbers : true,
							pagination : true,
							singleSelect : true,
							idField : 'id',
							pageSize : 20,
							pageList : [ 10, 20, 30, 50 ],

							columns : [ [
									{
										width : '120',
										title : '申请单编号',
										field : 'applicationno'
									},
									{
										width : '120',
										title : '申请人',
										field : 'applicant'
									},
									{
										width : '140',
										title : '申请日期',
										field : 'applicationdate'
									},
									{
										width : '180',
										title : '变更内容',
										field : 'changecontent'

									},
									{
										width : '80',
										title : '类型',
										field : 'bustype'

									},
									{
										width : '140',
										title : '状态',
										field : 'status',
										formatter : function(value, row, index) {
											//alert(value);
											value = parseInt(value);
											switch (value) {
											case 0:
												return '已处理';
											case 1:
												return '未处理';
											default:
												return '未处理';
											}
										}
									},
									{
										field : 'action',
										title : '操作',
										width : 130,
										formatter : function(value, row, index) {
											var str = '';
											<shiro:hasPermission name="/changeOrder/confirm">
											str += $
													.formatString(
															'<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="confirmFun(\'{0}\');" >确定</a>',
															row.id);
											</shiro:hasPermission>
											return str;
										}
									} ] ],
							onLoadSuccess : function(data) {
								$('.user-easyui-linkbutton-edit').linkbutton({
									text : '确定',
									plain : true,
									iconCls : 'icon-edit'
								});
							},
							toolbar : '#toolbar'
						});
	});

	function confirmFun(id) {
		/* var row = $('#dataGrid').datagrid('getSelected');
		alert(row.status);
		if (row.status != '1') {
			parent.$.messager.alert('提示', "已审核，请不要重复操作！", 'info');
			return false;
		}
 */
		if (id == undefined) {
			id = rows[0].id;
		} else {
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		progressLoad();
		$.post('${path }/changeOrder/confirm', {
			id : id
		}, function(result) {
			if (result.success) {
				parent.$.messager.alert('提示', result.msg, 'info');
				dataGrid.datagrid('reload');
			}
			progressClose();
		}, 'JSON');
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">

	<div data-options="region:'center',border:true,title:'待办事项列表'">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
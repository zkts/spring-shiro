<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<script type="text/javascript">
	$(function() {
		$('input.easyui-validatebox').validatebox({
			validateOnCreate: false,
			err: function(target, message, action){
				var opts = $(target).validatebox('options');
				message = message || opts.prompt;
				$.fn.validatebox.defaults.err(target, message, action);
			}
		});
		$('#addForm').form({
			url : '${path }/plotterInfoManage/dataSave',
			onSubmit : function() {
				progressLoad();
				var isValid = $(this).form('validate');
				if (!isValid) {
					progressClose();
				}
				return isValid;
			},
			success : function(result) {
				progressClose();
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('提示', result.msg, 'warning');
				}
			}
		});

	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden; padding: 3px;">
		<form id="addForm" method="post">
			<table class="grid">
				<tr>
					<td>部门</td>
					<td><input name="resdepart" type="text" placeholder="请输入部门" class="easyui-validatebox" data-options="required:true" value=""></td>
					<td>责任人</td>
					<td><input name="resperson" type="text" placeholder="请输入责任人" class="easyui-validatebox" data-options="required:true" value=""></td>
				</tr>

				<tr>
					<td>信息设备编号</td>
					<td><input name="informdevno" type="text" placeholder="请输入信息设备编号" class="easyui-validatebox" data-options="required:true" value=""></td>
					<td>设备密级</td>
					<td><input name="devseclevel" type="text" placeholder="请输入设备密级" class="easyui-validatebox" data-options="required:true" value=""></td>
				</tr>

				<tr>
					<td>品牌型号</td>
					<td><input name="brand" type="text" placeholder="请输入品牌型号" class="easyui-validatebox" data-options="required:true" value=""></td>
					<td>用途</td>
					<td><input name="purpose" type="text" placeholder="请输入用途" class=" easyui-validatebox" data-options="required:true" value=""></td>
				</tr>


				<tr>
					<td>设备生产日期</td>
					<td><input name="devproductdate" placeholder="请输入设备生产日期" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						class="easyui-validatebox" data-options="required:true" value=""></td>
					<td>出厂编号</td>
					<td><input name="productno" type="text" placeholder="请输入出厂编号" class="easyui-validatebox" data-options="required:true" value=""></td>
				</tr>


				<tr>
					<td>硬件配置</td>
					<td><input name="hardwareconf" type="text" placeholder="请输入硬件配置" class="easyui-validatebox" data-options="required:true" value=""></td>
					<td>硬盘序列号</td>
					<td><input name="diskno" type="text" placeholder="请输入硬盘序列号" class="easyui-validatebox" data-options="required:true" value=""></td>
				</tr>
				<tr>
					<td>MAC地址</td>
					<td><input name="mac" type="text" placeholder="MAC地址" class="easyui-validatebox" data-options="required:true" value=""></td>
					<td>操作系统</td>
					<td><input name="os" type="text" placeholder="请输入操作系统" class="easyui-validatebox" data-options="required:true" value=""></td>
				</tr>

				<tr>
					<td>系统安装时间</td>
					<td><input name="osinsttime" placeholder="请输入系统安装时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						class="easyui-validatebox" data-options="required:true" value=""></td>
					<td></td>
					<td></td>
				</tr>


			</table>
		</form>
	</div>
</div>
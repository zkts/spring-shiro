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
		$('#editForm').form({
			url : '${path }/computerManage/edit',
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
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden; padding: 3px;">
		<table class="grid">

			<tr>

				<td>设备编号</td>
				<td><input name="bus_type" type="hidden" value="新增" /><input name="id" type="hidden" value="${computerInfo.id}" /><input name="devno" type="text" placeholder="请输入信息设备编号"
					class="easyui-validatebox" data-options="required:true" value="${computerInfo.devno}"></td>
				<td>部门名称</td>
				<td><input name="depname" type="text" placeholder="请输入部门名称" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.depname}"></td>
			</tr>

			<tr>
				<td>责任人</td>
				<td><input name="resperson" type="text" placeholder="请输入责任人" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.resperson}"></td>
				<td>设备密级</td>
				<td><input name="devseclevel" type="text" placeholder="请输入设备密级" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.devseclevel}"></td>
			</tr>

			<tr>
				<td>资产编号</td>
				<td><input name="propertyno" type="text" placeholder="请输入资产编号" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.propertyno}"></td>
				<td>资产归属</td>
				<td><input name="propertyown" type="text" placeholder="请输入资产归属" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.propertyown}"></td>
			</tr>


			<tr>
				<td>设备出厂编号</td>
				<td><input name="devorigno" type="text" placeholder="请输入设备出厂编号" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.devorigno}"></td>
				<td>设备型号</td>
				<td><input name="infodevno" type="text" placeholder="请输入设备型号" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.infodevno}"></td>
			</tr>


			<tr>
				<td>硬盘序列号</td>
				<td><input name="diskno" type="text" placeholder="请输入硬盘序列号" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.diskno}"></td>
				<td>规格</td>
				<td><input name="devstandard" type="text" placeholder="请输入规格" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.devstandard}"></td>
			</tr>


			<tr>
				<td>启用时间</td>
				<td><input name="starttime" type="text" placeholder="请输入启用时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					class="easyui-validatebox" data-options="required:true" value="${computerInfo.starttime}"></td>
				<td>设备名称</td>
				<td><input name="devname" type="text" placeholder="请输入设备名称" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.devname}"></td>
			</tr>

			<tr>
				<td>IP地址</td>
				<td><input name="ipaddress" type="text" placeholder="请输入IP地址" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.ipaddress}"></td>
				<td>VLAN</td>
				<td><input name="vlan" type="text" placeholder="请输入VLAN" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.vlan}"></td>
			</tr>
			<tr>
				<td>MAC地址</td>
				<td><input name="mac" type="text" placeholder="请输入MAC地址" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.mac}"></td>
				<td>交换机端口号</td>
				<td><input name="switchport" type="text" placeholder="请输入交换机端口号" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.switchport}"></td>
			</tr>
			<tr>
				<td>配线架</td>
				<td><input name="patchpanel" type="text" placeholder="请输入配线架" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.patchpanel}"></td>
				<td>物理位置</td>
				<td><input name="phylocation" type="text" placeholder="请输入物理位置" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.phylocation}"></td>
			</tr>
			<tr>
				<td>操作系统版本</td>
				<td><input name="osversion" type="text" placeholder="请输入操作系统版本" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.osversion}"></td>
				<td>操作系统安装时间</td>
				<td><input name="osinstime" placeholder="请输入操作系统安装时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					class="easyui-validatebox" data-options="required:true" value="${computerInfo.osinstime}"></td>
			</tr>
			<tr>
				<td>CAKEY编号</td>
				<td><input name="cakeyno" type="text" placeholder="请输入CAKEY编号" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.cakeyno}"></td>
				<td>网管备注</td>
				<td><input name="networkmark" type="text" placeholder="请输入网管备注" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.networkmark}"></td>
			</tr>
			<tr>
				<td>使用情况</td>
				<td><input name="usedstatus" type="text" placeholder="请输入使用情况" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.usedstatus}"></td>
				<td>离网时间</td>
				<td><input name="leaveTime" type="text" placeholder="请输入离网时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					class="easyui-validatebox" data-options="required:true" value="${computerInfo.leaveTime}"></td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input name="remark" type="text" placeholder="请输入备注" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.remark}"></td>
				<td>是否安装视频干扰仪</td>
				<td><input name="isInstall" type="text" placeholder="请输入是否安装视频干扰仪" class="easyui-validatebox" data-options="required:true"
					value="${computerInfo.isInstall}"></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</div>

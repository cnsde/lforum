<#-- 
	描述：快速登录模板
	作者：黄磊 
	版本：v1.0 
-->
<div class="box message">
	<h1>${config.forumtitle} 提示信息</h1>
	<p>您无权进行当前操作，这可能因以下原因之一造成</p>
	<p><b>${reqcfg.msgbox_text}</b></p>
	<p>您还没有登录，请填写下面的登录表单后再尝试访问。</p>

	<form id="formlogin" name="formlogin" method="post" action="login.action" onsubmit="submitLogin(this);">
		<input type="hidden" value="2592000" name="cookietime"/>
	<div class="box" style="margin: 10px auto; width: 60%;">
		<table cellpadding="4" cellspacing="0" width="100%">
		<thead>
			<tr>
				<td colspan="2">会员登录</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>用户名</td>
				<td><input type="text" id="username" name="username" size="25" maxlength="40" tabindex="2" />  <a href="register.action" tabindex="-1" accesskey="r" title="立即注册 (ALT + R)">立即注册</a>
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password" size="25" tabindex="3" /> <a href="getpassword.action" tabindex="-1" accesskey="g" title="忘记密码 (ALT + G)">忘记密码</a>
				</td>
			</tr>
		<#if config.secques==1>
			<tr>
				<td>安全问题</td>
				<td>
					<select name="questionid" tabindex="4">
					<option value="0">&nbsp;</option>
					<option value="1">母亲的名字</option>
					<option value="2">爷爷的名字</option>
					<option value="3">父亲出生的城市</option>
					<option value="4">您其中一位老师的名字</option>
					<option value="5">您个人计算机的型号</option>
					<option value="6">您最喜欢的餐馆名称</option>
					<option value="7">驾驶执照的最后四位数字</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>答案</td>
				<td><input type="text" name="answer" size="25" tabindex="5" /></td>
			</tr>
		</#if>
			<tr>
				<td>&nbsp;</td>
				<td>
					<button class="submit" type="submit" name="loginsubmit" id="loginsubmit" value="true" tabindex="6">会员登录</button>
				</td>
			</tr>
		</tbody>
		</table>
	</div>
	</form>
<script type="text/javascript">
	document.getElementById("username").focus();
	function submitLogin(loginForm)
	{
		loginForm.action = 'login.action?loginsubmit=true&reurl=' + escape(window.location);
		loginForm.submit();
	}
</script>
</div>
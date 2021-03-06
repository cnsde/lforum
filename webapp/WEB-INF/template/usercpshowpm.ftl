<#-- 
	描述：短信显示模板
	作者：黄磊 
	版本：v1.0 
-->
<#import "inc/page_comm.ftl" as comm />
<@comm.header/>
<!--header end-->
<div id="foruminfo">
	<div id="nav">
		<a href="${config.forumurl}" class="home">${config.forumtitle}</a>  &raquo; <a href="usercp.action">用户中心</a>  &raquo; <strong>查看短消息</strong>
	</div>
	<div id="headsearch">
		<div id="search">
			<@comm.quicksearch/>
		</div>
	</div>
</div>
<#if reqcfg.page_err==0>
<!--主体-->
<div class="controlpannel">
   <@comm.menu/>
	<div class="pannelcontent">
		<div class="pcontent">
			<div class="panneldetail">
				<@comm.smsmenu/>	
				<div class="pannelbody">
					<div class="pannellist">
				    <#if ispost>
						<@comm.msgbox/>
					<#else>
				    <ul>
						<li class="notetitle">${subject}</li>
						<li class="notetime">发送人:${msgfrom}  ${postdatetime}</li>
						<li class="notecontent">${message}</li>
						<li class="notecontent"><img src="templates/${templatepath}/images/leftdot.gif" alt="查看信息"/>
							<a href="usercpinbox.action">返回列表</a>
							<a href="usercppostpm.action?action=re&amp;pmid=${pmid}">回复</a>
							<a href="usercppostpm.action?action=fw&amp;pmid=${pmid}">转发</a>
							<a href="usercpshowpm.action?action=noread&amp;pmid=${pmid}">标记为未读</a>
							<a href="usercpshowpm.action?action=delete&amp;pmid=${pmid}">删除</a>
						</li>
					</ul>
						<#if canreplypm>
						<form id="postpm" name="postpm" method="post" action="usercppostpm.action?action=re&amp;pmid=${pmid}">
						<label for="user" class="labelshort">接件人:</label>
						<input name="msgto" type="text" id="msgto" value="${msgfrom}" size="20" /><br />
						<label for="email" class="labelshort">标题:</label>
						<input name="subject" type="text" id="subject" value="${resubject}" size="40" /><br />
						<label for="comment" class="labelshort">内容:</label>
						<textarea name="message" cols="80" rows="20" id="message" onkeydown="if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) document.getElementById('postpm').submit();" style="width:80%;">${remessage}</textarea><br/>
						<label for="savetosentbox"  class="labelshort">&nbsp;</label>
						<input name="savetosentbox" type="checkbox" id="Checkbox1" value="1" style="border:0;" />发送的同时保存到发件箱
						<input type="checkbox" name="emailnotify" id="emailnotify" />邮件通知<br />
						<#if isseccode>
						<label for="savetosentbox"  class="labelshort">验证码</label><@comm.vcode/><br />
						</#if>
						<label for="savetosentbox"  class="labelshort">&nbsp;</label><input name="sendmsg" type="submit" id="sendmsg" value="立即发送"/>
						<input name="savetousercpdraftbox" type="submit" id="savetousercpdraftbox" value="存为草稿"/>
						[完成后可按Ctrl+Enter提交]
					</form>
				</#if>
				</#if>
			  </div>
			</div>
		</div>
	</div>
</div>
</div>
<!--主体-->
</div>
<@comm.copyright/>
<#else>
<@comm.errmsgbox/>
</div>
</#if>
<@comm.footer/>

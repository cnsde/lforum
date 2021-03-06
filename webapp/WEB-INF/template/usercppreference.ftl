<#-- 
	描述：用户中心个性设置模板
	作者：黄磊 
	版本：v1.0 
-->
<#import "inc/page_comm.ftl" as comm />
<@comm.header/>
<!--header end-->

<script type="text/javascript">
function changeAvatarOption(currentOption)
{
	if ($('enterurl'))
	{
		$('enterurl').style.display='none';
	}
	if ($('uploadfile'))
	{
		$('uploadfile').style.display='none';
	}
	switch (currentOption)
	{
		case "0":
			$('templateid').style.display='none';
			break;
		case "1":
			$('uploadfile').style.display='block';
			break;
		case "2":
			$('enterurl').style.display='block';
			break;
	}
}
</script>

<div id="foruminfo">
	<div id="nav">
		<a href="${config.forumurl}" class="home">${config.forumtitle}</a>  &raquo; <a href="usercp.action">用户中心</a>  &raquo; <strong>个性设置</strong>
	</div>
	<div id="headsearch">
		<div id="search">
			<@comm.quicksearch/>
		</div>
	</div>
</div>

<!--主体-->
<div class="controlpannel">
   <@comm.menu/>
	<div class="pannelcontent">
		<div class="pcontent">
			<div class="panneldetail">
				<@comm.permenu/>	
				<div class="pannelbody">
					<div class="pannellist">
					<#if reqcfg.page_err==0>
						<#if ispost>
							<@comm.msgbox/>
						<#else>
						<form action="" method="post" ID="Form1" enctype="multipart/form-data">
								<label for="templateid" class="labellong2" style="line-height:220%;">风格:</label>
								<select name="templateid" id="templateid" >
								<option value="0" <#if user.templateid==0>selected</#if>>默认</option>
								<#list templatelist as template>
								<option value="${template.templateid}" 
								<#if user.templateid==template.templateid>selected</#if>
								>${template.name}</option>
								</#list>
							    </select>
								<br />
								<div class="photoimg" style="border-top:1px dashed #CCC; margin-bottom:10px; ">
								<img src="${user.userfields.avatar}" <#if (user.userfields.avatarwidth>0)>width="${user.userfields.avatarwidth}" height="${user.userfields.avatarheight}"</#if> id="usingavatarimg" alt="形象图"/>
									<#if (usergroupinfo.allowavatar>0)>
										<ul id="avatarbox">
										<#if (usergroupinfo.allowavatar>1)>
											<li>
												<input type="radio" id="avatartype1" name="avatartype" value="2" onclick="changeAvatarOption(this.value);"
												<#if avatartype==2>
													checked="checked"
												</#if>/><label for="avatartype1">使用外部图片</label>
												<div id="enterurl" style="display: none;">
													URL地址: <input name="avatarurl" type="text" id="avatarurl" value="${avatarurl}" size="40" />
													宽度:
													<input name="avatarwidth" type="text" id="avatarwidth" value="${avatarwidth}" size="3" maxlength="3" style="width: 30px;" /> &nbsp; &nbsp; 
													高度:
													<input name="avatarheight" type="text" id="avatarheight" value="${avatarheight}" size="3" maxlength="3" style="width: 30px;" />	
												</div>
											</li>
										</#if>
										<#if (usergroupinfo.allowavatar>2)>
											<li>
												<input type="radio" id="avatartype2" name="avatartype" value="1" onclick="changeAvatarOption(this.value);"
												<#if avatartype==1>
													checked="checked"
												</#if>/><label for="avatartype2">上传头像图片</label>
												<div id="uploadfile" style="display: none;">
												选择本地图片文件: <input name="file" id="file" type="file" size="40"/>
												</div>
											</li>
										</#if>
										<li>
											<input type="radio" id="avatartype3" name="avatartype" value="0" onclick="changeAvatarOption(this.value);BOX_show('fromsystem');" 
											<#if avatartype==0>
												checked="checked"
											</#if>
											/><label for="avatartype3">使用系统头像 (点击选择...)</label>
											<input type="hidden" name="usingavatar" id="usingavatar" value="{avatar}" />
										</li>
										</ul>
									<#else>
										<ul style="margin-top: 40px;"><li>您所在的用户组 "${usergroupinfo.grouptitle}" 没有更改头像的权限</li></ul>
									</#if>
								</div>
								<input id="sendmsg" type="submit" value="确定" name="sendmsg"/>
						</form>
						</#if>
						</div>
					<#else>
					<@comm.usercperrmsgbox/>
					</#if>
			  </div>
			</div>
		</div>
	</div>
</div>
<!--主体-->
</div>
<@comm.copyright/>
<#if reqcfg.page_err==0 && !ispost>
	<div id="BOX_overlay" style="background: #000; position: absolute; z-index:100; filter:alpha(opacity=50);-moz-opacity: 0.6;opacity: 0.6;"></div>
	<script type="text/javascript" src="javascript/template_album.js"></script>
	<script type="text/javascript">
		function usethisavatar(e)
		{
			$('usingavatar').value = e.src;
			
			var avatars = $('fromsystem').getElementsByTagName('div');
			for (var i=0; i < avatars.length;i++)
			{
				avatars[i].style.border = "2px dashed white";
			}
			e.parentNode.style.border = "2px dashed black";
		}
		function selectionborder(e)
		{
			if (e.style.border != "2px dashed black" && e.style.border != "black 2px dashed")
			{				
				if (e.style.border == "2px dashed red" || e.style.border == "red 2px dashed" )
				{
					e.style.border = "2px dashed white";
				}
				else
				{
					e.style.border = "2px dashed red";
				}
			}
		}
	</script>

	<div id="fromsystem" class="avatarbackground" style="display: none; position: relative;">
			<div class="avatarlist">
				<ul>
					<#list avatarfilelist as avatarfile>
						<li>
							<div onmouseover="selectionborder(this)" onmouseout="selectionborder(this)" style="<#if avatarfile==avatar>border: 2px dashed black;<#else>border: 2px dashed white;</#if>cursor: pointer; overflow:hidden; zoom:1;" ><img src="${avatarfile}" onclick="usethisavatar(this);" alt="形象图名称"/></div>
						</li>
					</#list>
				</ul>
			</div>
			<span class="avatarbutton">
				<input type="button" name="userthisavatar" id="userthisavatar" value="确定" onclick="$('templateid').style.display='';$('usingavatarimg').src=$('usingavatar').value;BOX_remove('fromsystem');" />
				<input type="button" name="canceluserthisavatar" id="canceluserthisavatar" value="取消" onclick="$('templateid').style.display='';BOX_remove('fromsystem');" />
			</span>
	</div>
</#if>
<@comm.footer/>
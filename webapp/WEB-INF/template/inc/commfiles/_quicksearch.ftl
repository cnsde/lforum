<#-- 
	描述：快速搜索模板
	作者：黄磊 
	版本：v1.0 
-->	
<form method="post" action="search.action" target="_blank" onsubmit="bind_keyword(this);">
	<input type="hidden" name="poster" />
	<input type="hidden" name="keyword" />
	<input type="hidden" name="type" value="" />
	<input id="keywordtype" type="hidden" name="keywordtype" value="0"/>
	<div id="searchbar">
		<dl>
			<dt id="quicksearch" class="s2" onclick="showMenu(this.id, false);" onmouseover="MouseCursor(this);">帖子标题</dt>
				<dd class="textinput"><input type="text" name="keywordf" value="" class="text"/></dd>
				<dd><input name="searchsubmit" type="submit" value="" class="s3"/></dd>
		</dl>
	</div>
</form>
<script type="text/javascript">function bind_keyword(form){if(form.keywordtype.value=='8'){form.keyword.value='';form.poster.value=form.keywordf.value; } else { form.poster.value=''; form.keyword.value=form.keywordf.value;if(form.keywordtype.value == '2')form.type.value = 'spacepost';if(form.keywordtype.value == '3')form.type.value = 'album';}}</script>
<div class="fsbr">
<form name="fsb" id="v4-0" method="get" action="/spring/test/search.action">
<table cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
		  <td class="keys">
			<label for="searchQuery" class="g-hdn">Enter your search keyword</label>
			 <span id="v4-1" class="afi halo"> <span class="mid">
			<span class="inr"> <input autocomplete="off" id="searchQuery" name="searchQuery"
				maxlength="300" value="" class="afi" type="text">
				<b id="e2" class="on" title="Show suggestions"> </b> </span> </span> </span>
		  </td>
		  <td class="cats"><label for="v4-3" class="g-hdn">Select a category for search</label>
			<select name="_sacat" id="v4-3" class="cats">
				<option selected="selected" value="0">All Categories</option>
				<!-- BEGIN CATS_BLOCK -->
				<option value="{CAT_NUMBER}">{CAT_NAME}</option>
				<!-- END CATS_BLOCK -->
			</select>
		  </td>
	      <td class="lnks"><input class="srch" id="q_3" value="Search" type="submit">
				<span class="flds"> <input name="_odkw" value="test"
				type="hidden"> <input name="_osacat" value="0" type="hidden"> <input
				name="_trksid" value="" type="hidden"> </span>
		  </td>
		</tr>
		<tr>
			<td class="rls" colspan="2"></td>
		</tr>
	</tbody>
</table>
</form>
</div>
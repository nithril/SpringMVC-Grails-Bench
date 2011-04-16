<div id="v4-4" class="fpcc">
<div>
	<span>
		<h1 class="smuy">
            <g:if test="${results}">
                <span class="countClass">${results.findItemsByKeywordsResponse.get(0).paginationOutput.get(0).totalPages.get(0).getAsString()}</span> <span
                    class="matchClass">results found for</span> <span class="keywordClass"id="v4-5">${params.get('searchQuery')}</span>

            </g:if>

		</h1>
	</span>
	<span class="saveSearch"> </span>
	<span> </span>
</div>
</div>
